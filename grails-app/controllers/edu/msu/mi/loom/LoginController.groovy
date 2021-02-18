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

//        def config = SpringSecurityUtils.securityConfig
//        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
//        println(postUrl)
//        def orig = session.getAttribute("SPRING_SECURITY_SAVED_REQUEST")
//
//        println(orig)
//        if (orig?.parameters?.workerId && orig?.parameters?.pass){
//            println("whyyyyysdf")
//            println(orig.parameters)
//        }
//        return render(view: "admin_auth", model: [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter])
        def orig = session.getAttribute("SPRING_SECURITY_SAVED_REQUEST")

        def original = orig?.requestURL
        def username = null
        def password = null

        if (orig?.parameters?.workerId && orig?.parameters?.pass) {
            username = orig.parameters.workerId[0]
            password = orig.parameters.pass[0]
//            password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password as String) : password

            User u = User.findByUsernameAndPassword(username as String,password as String)
            if(u){
                springSecurityService.reauthenticate(u.username)
            }
//            springSecurityService.user(username as String,password as String)

//            User u = User.findByUsername(username)
//            if (u) {
//                springSecurityService.reauthenticate(u.username,password)
//            } else {
//                u = userService.createUser(username)
//                if (u?.id) {
//                    springSecurityService.reauthenticate(u.username,password)
//                }
//            }
        }
        if (request.forwardURI.contains('admin') | request.forwardURI.contains('/')) {
            def config = SpringSecurityUtils.securityConfig
            String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
//            def orig = session.getAttribute("SPRING_SECURITY_SAVED_REQUEST")
            println(postUrl)
            return render(view: "admin_auth", model: [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter])

        }
        if (springSecurityService.isLoggedIn()) {
            if (original) {
                if (username) {
                    log.debug("Redirecting with parameters")
                    return redirect(url: "$original?workerid=$username")
                } else {

                    return redirect(url: "$original")
                }
            }
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
