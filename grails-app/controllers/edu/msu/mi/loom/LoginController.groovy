/* Copyright 2013-2015 SpringSource.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.msu.mi.loom

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import groovy.util.logging.Slf4j
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.context.SecurityContextHolder as SCH
import org.springframework.security.web.WebAttributes
import javax.servlet.http.HttpServletResponse

@Slf4j
@Secured('permitAll')
class LoginController {

    /**
     * Dependency injection for the authenticationTrustResolver.
     */
    def authenticationTrustResolver

    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService

    def userService

    /**
     * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
     */
    def index() {
        //log.debug("${request.contextPath}${config.apf.filterProcessesUrl}")
        if (springSecurityService.isLoggedIn()) {
            log.debug("We are here in login controller")
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        } else {
            redirect action: 'auth', params: params
        }
    }

    /**
     * Show the login page.
     */
    def auth() {

        println "Authenticating..."
        def orig = session.getAttribute("SPRING_SECURITY_SAVED_REQUEST")
        if(request.forwardURI.contains('admin') ){
            def config = SpringSecurityUtils.securityConfig
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
            return render(view: "admin_auth", model: [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter])
        }
        if(orig?.parameters?.workerId){
            String workerId = orig.parameters.workerId[0]
            String assignmentId = null
            User u = User.findByUsername(workerId)
            if(orig.parameters.assignmentId && orig.parameters.assignmentId[0]!="null"){
                assignmentId = orig.parameters?.assignmentId[0]
                u = User.findByTurkerId(workerId)
            }

            if (u) {
                springSecurityService.reauthenticate(u.username)
            } else {
                if(assignmentId){
                    u = userService.createUserByWorkerId(workerId, true)

                }else{
                    u = userService.createUserByWorkerId(workerId)
                }

                if (u?.id) {
                    springSecurityService.reauthenticate(u.username)
                }
            }
            if (springSecurityService.isLoggedIn()) {
                def original = orig?.requestURL
                if (original) {
                    if (workerId) {
                        log.debug("Redirecting with parameters")
                        return redirect(url: "$original?assignmentId=$assignmentId&workerId=$workerId")
                    } else {
                        return redirect(url: "$original")
                    }
                }
            }

        }
        else if (request.forwardURI.contains('/')) {
            def config = SpringSecurityUtils.securityConfig
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
            return render(view: "admin_auth", model: [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter])

        }


        return redirect(url: '/')

    }

    //String view = "auth"

    /**
     * The redirect action for Ajax requests.
     */
    def authAjax() {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    /**
     * Show denied page.
     */
    def denied() {
        if (springSecurityService.isLoggedIn() &&
                authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
            // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
            redirect action: 'full', params: params
        }
    }

    /**
     * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
     */
    def full() {
        def config = SpringSecurityUtils.securityConfig
        render view: 'auth', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
                        postUrl  : "${request.contextPath}${config.apf.filterProcessesUrl}"]
    }

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail() {

        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.expired")
            } else if (exception instanceof CredentialsExpiredException) {
                msg = g.message(code: "springSecurity.errors.login.passwordExpired")
            } else if (exception instanceof DisabledException) {
                msg = g.message(code: "springSecurity.errors.login.disabled")
            } else if (exception instanceof LockedException) {
                msg = g.message(code: "springSecurity.errors.login.locked")
            } else {
                msg = g.message(code: "springSecurity.errors.login.fail")
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        } else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess() {
        render([success: true, username: springSecurityService.authentication.name] as JSON)
    }

    /**
     * The Ajax denied redirect url.
     */
    def ajaxDenied() {
        render([error: 'access denied'] as JSON)
    }
}
