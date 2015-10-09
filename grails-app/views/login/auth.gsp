<g:applyLayout name="main">
    <div class="login-box">
        <div class="login-box-body">
            <p class="login-box-msg"><g:message code="page.auth.caption.label"/></p>

            <form action="../../index2.html" method="post">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="Username">
                </div>

                <div class="row">
                    <div class="col-xs-8">
                        <a href="register.html" class="text-center"><g:message
                                code="page.auth.not.registered.label"/></a>
                    </div>

                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</g:applyLayout>