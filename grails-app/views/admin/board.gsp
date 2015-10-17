<g:applyLayout name="main">
    <div class="wrapper">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Admin Board
                </h1>
                <ol class="breadcrumb">
                    <li><a href="javascript:void(0);"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">Admin board</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">

                <div class="row">
                    <div class="col-md-3">

                        <!-- Profile Image -->
                        <div class="box box-primary">
                            <div class="box-body box-profile">
                                <asset:image src="avatar.jpg" class="profile-user-img img-responsive img-circle"
                                             alt="User profile picture"/>
                                <h3 class="profile-username text-center">Admin</h3>

                                <p class="text-muted text-center">Super user</p>

                                <ul class="list-group list-group-unbordered">
                                    <li class="list-group-item">
                                        <b>Followers</b> <a class="pull-right">1,322</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Following</b> <a class="pull-right">543</a>
                                    </li>
                                    <li class="list-group-item">
                                        <b>Friends</b> <a class="pull-right">13,287</a>
                                    </li>
                                </ul>

                                <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->

                    <!-- About Me Box -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">About Me</h3>
                            </div><!-- /.box-header -->
                            <div class="box-body">
                                <strong><i class="fa fa-book margin-r-5"></i>  Education</strong>

                                <p class="text-muted">
                                    B.S. in Computer Science from the University of Tennessee at Knoxville
                                </p>

                                <hr>

                                <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

                                <p class="text-muted">Malibu, California</p>

                                <hr>

                                <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

                                <p>
                                    <span class="label label-danger">UI Design</span>
                                    <span class="label label-success">Coding</span>
                                    <span class="label label-info">Javascript</span>
                                    <span class="label label-warning">PHP</span>
                                    <span class="label label-primary">Node.js</span>
                                </p>

                                <hr>

                                <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
                            </div><!-- /.box-body -->
                        </div><!-- /.box -->
                    </div><!-- /.col -->
                    <div class="col-md-9">
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
                                %{--<li><a href="#timeline" data-toggle="tab">Timeline</a></li>--}%
                                %{--<li><a href="#settings" data-toggle="tab">Settings</a></li>--}%
                            </ul>

                            <div class="tab-content">
                                <div class="active tab-pane" id="activity">
                                    <!-- Post -->
                                    <div class="post">
                                        <div class="user-block">
                                            <img class="img-circle img-bordered-sm"
                                                 src="../../dist/img/user1-128x128.jpg" alt="user image">
                                            <span class='username'>
                                                <a href="#">Jonathan Burke Jr.</a>
                                                <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i>
                                                </a>
                                            </span>
                                            <span class='description'>Shared publicly - 7:30 PM today</span>
                                        </div><!-- /.user-block -->
                                        <p>
                                            Lorem ipsum represents a long-held tradition for designers,
                                            typographers and the like. Some people hate it and argue for
                                            its demise, but others ignore the hate as they create awesome
                                            tools to help create filler text for everyone from bacon lovers
                                            to Charlie Sheen fans.
                                        </p>
                                        <ul class="list-inline">
                                            <li><a href="#" class="link-black text-sm"><i
                                                    class="fa fa-share margin-r-5"></i> Share</a></li>
                                            <li><a href="#" class="link-black text-sm"><i
                                                    class="fa fa-thumbs-o-up margin-r-5"></i> Like</a></li>
                                            <li class="pull-right"><a href="#" class="link-black text-sm"><i
                                                    class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
                                        </ul>

                                        <input class="form-control input-sm" type="text" placeholder="Type a comment">
                                    </div><!-- /.post -->

                                <!-- Post -->
                                    <div class="post clearfix">
                                        <div class='user-block'>
                                            <img class='img-circle img-bordered-sm'
                                                 src='../../dist/img/user7-128x128.jpg' alt='user image'>
                                            <span class='username'>
                                                <a href="#">Sarah Ross</a>
                                                <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i>
                                                </a>
                                            </span>
                                            <span class='description'>Sent you a message - 3 days ago</span>
                                        </div><!-- /.user-block -->
                                        <p>
                                            Lorem ipsum represents a long-held tradition for designers,
                                            typographers and the like. Some people hate it and argue for
                                            its demise, but others ignore the hate as they create awesome
                                            tools to help create filler text for everyone from bacon lovers
                                            to Charlie Sheen fans.
                                        </p>

                                        <form class='form-horizontal'>
                                            <div class='form-group margin-bottom-none'>
                                                <div class='col-sm-9'>
                                                    <input class="form-control input-sm" placeholder="Response">
                                                </div>

                                                <div class='col-sm-3'>
                                                    <button class='btn btn-danger pull-right btn-block btn-sm'>Send</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div><!-- /.post -->

                                <!-- Post -->
                                    <div class="post">
                                        <div class='user-block'>
                                            <img class='img-circle img-bordered-sm'
                                                 src='../../dist/img/user6-128x128.jpg' alt='user image'>
                                            <span class='username'>
                                                <a href="#">Adam Jones</a>
                                                <a href='#' class='pull-right btn-box-tool'><i class='fa fa-times'></i>
                                                </a>
                                            </span>
                                            <span class='description'>Posted 5 photos - 5 days ago</span>
                                        </div><!-- /.user-block -->
                                        <div class='row margin-bottom'>
                                            <div class='col-sm-6'>
                                                <img class='img-responsive' src='../../dist/img/photo1.png' alt='Photo'>
                                            </div><!-- /.col -->
                                            <div class='col-sm-6'>
                                                <div class='row'>
                                                    <div class='col-sm-6'>
                                                        <img class='img-responsive' src='../../dist/img/photo2.png'
                                                             alt='Photo'>
                                                        <br>
                                                        <img class='img-responsive' src='../../dist/img/photo3.jpg'
                                                             alt='Photo'>
                                                    </div><!-- /.col -->
                                                    <div class='col-sm-6'>
                                                        <img class='img-responsive' src='../../dist/img/photo4.jpg'
                                                             alt='Photo'>
                                                        <br>
                                                        <img class='img-responsive' src='../../dist/img/photo1.png'
                                                             alt='Photo'>
                                                    </div><!-- /.col -->
                                                </div><!-- /.row -->
                                            </div><!-- /.col -->
                                        </div><!-- /.row -->

                                        <ul class="list-inline">
                                            <li><a href="#" class="link-black text-sm"><i
                                                    class="fa fa-share margin-r-5"></i> Share</a></li>
                                            <li><a href="#" class="link-black text-sm"><i
                                                    class="fa fa-thumbs-o-up margin-r-5"></i> Like</a></li>
                                            <li class="pull-right"><a href="#" class="link-black text-sm"><i
                                                    class="fa fa-comments-o margin-r-5"></i> Comments (5)</a></li>
                                        </ul>

                                        <input class="form-control input-sm" type="text" placeholder="Type a comment">
                                    </div><!-- /.post -->
                                </div><!-- /.tab-pane -->
                            </div><!-- /.tab-content -->
                        </div><!-- /.nav-tabs-custom -->
                    </div><!-- /.col -->
                </div><!-- /.row -->

            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Create the tabs -->
            <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
                <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <!-- Home tab content -->
                <div class="tab-pane" id="control-sidebar-home-tab">
                    <h3 class="control-sidebar-heading">Recent Activity</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript:void(0);">
                                <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                    <p>Will be 23 on April 24th</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-user bg-yellow"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                                    <p>New phone +1(800)555-1234</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                                    <p>nora@example.com</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <i class="menu-icon fa fa-file-code-o bg-green"></i>

                                <div class="menu-info">
                                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                                    <p>Execution time 5 seconds</p>
                                </div>
                            </a>
                        </li>
                    </ul><!-- /.control-sidebar-menu -->

                    <h3 class="control-sidebar-heading">Tasks Progress</h3>
                    <ul class="control-sidebar-menu">
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">
                                    Custom Template Design
                                    <span class="label label-danger pull-right">70%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">
                                    Update Resume
                                    <span class="label label-success pull-right">95%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">
                                    Laravel Integration
                                    <span class="label label-warning pull-right">50%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="javascript::;">
                                <h4 class="control-sidebar-subheading">
                                    Back End Framework
                                    <span class="label label-primary pull-right">68%</span>
                                </h4>

                                <div class="progress progress-xxs">
                                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                                </div>
                            </a>
                        </li>
                    </ul><!-- /.control-sidebar-menu -->

                </div><!-- /.tab-pane -->
            <!-- Stats tab content -->
                <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
            <!-- Settings tab content -->
                <div class="tab-pane" id="control-sidebar-settings-tab">
                    <form method="post">
                        <h3 class="control-sidebar-heading">General Settings</h3>

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Report panel usage
                                <input type="checkbox" class="pull-right" checked>
                            </label>

                            <p>
                                Some information about this general settings option
                            </p>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Allow mail redirect
                                <input type="checkbox" class="pull-right" checked>
                            </label>

                            <p>
                                Other sets of options are available
                            </p>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Expose author name in posts
                                <input type="checkbox" class="pull-right" checked>
                            </label>

                            <p>
                                Allow the user to show his name in blog posts
                            </p>
                        </div><!-- /.form-group -->

                        <h3 class="control-sidebar-heading">Chat Settings</h3>

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Show me as online
                                <input type="checkbox" class="pull-right" checked>
                            </label>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Turn off notifications
                                <input type="checkbox" class="pull-right">
                            </label>
                        </div><!-- /.form-group -->

                        <div class="form-group">
                            <label class="control-sidebar-subheading">
                                Delete chat history
                                <a href="javascript:void(0);" class="text-red pull-right"><i class="fa fa-trash-o"></i>
                                </a>
                            </label>
                        </div><!-- /.form-group -->
                    </form>
                </div><!-- /.tab-pane -->
            </div>
        </aside><!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
</g:applyLayout>