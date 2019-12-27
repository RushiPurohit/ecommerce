<aside id="rightsidebar" class="right-sidebar">
            <ul class="nav nav-tabs tab-nav-right" role="tablist">
                <li role="presentation" class="active"><a href="#skins" data-toggle="tab"><?php echo app('translator')->getFromJson('language.skin'); ?></a></li>
                <!-- <li role="presentation"><a href="#settings" data-toggle="tab"><?php echo app('translator')->getFromJson('language.setting'); ?></a></li> -->
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active in active" id="skins">
                    <ul class="demo-choose-skin">
                        <li data-theme="red" class="active">
                            <div class="red"></div>
                            <span><?php echo app('translator')->getFromJson('language.red'); ?></span>
                        </li>
                        <li data-theme="pink">
                            <div class="pink"></div>
                            <span><?php echo app('translator')->getFromJson('language.pink'); ?></span>
                        </li>
                        <li data-theme="purple">
                            <div class="purple"></div>
                            <span><?php echo app('translator')->getFromJson('language.purple'); ?></span>
                        </li>
                        <li data-theme="deep-purple">
                            <div class="deep-purple"></div>
                            <span><?php echo app('translator')->getFromJson('language.deep_purple'); ?></span>
                        </li>
                        <li data-theme="indigo">
                            <div class="indigo"></div>
                            <span><?php echo app('translator')->getFromJson('language.indigo'); ?></span>
                        </li>
                        <li data-theme="blue">
                            <div class="blue"></div>
                            <span><?php echo app('translator')->getFromJson('language.blue'); ?></span>
                        </li>
                        <li data-theme="light-blue">
                            <div class="light-blue"></div>
                            <span><?php echo app('translator')->getFromJson('language.light_blue'); ?></span>
                        </li>
                        <li data-theme="cyan">
                            <div class="cyan"></div>
                            <span><?php echo app('translator')->getFromJson('language.cyan'); ?></span>
                        </li>
                        <li data-theme="teal">
                            <div class="teal"></div>
                            <span><?php echo app('translator')->getFromJson('language.teal'); ?></span>
                        </li>
                        <li data-theme="green">
                            <div class="green"></div>
                            <span><?php echo app('translator')->getFromJson('language.green'); ?></span>
                        </li>
                        <li data-theme="light-green">
                            <div class="light-green"></div>
                            <span><?php echo app('translator')->getFromJson('language.light_green'); ?></span>
                        </li>
                        <li data-theme="lime">
                            <div class="lime"></div>
                            <span><?php echo app('translator')->getFromJson('language.lime'); ?></span>
                        </li>
                        <li data-theme="yellow">
                            <div class="yellow"></div>
                            <span><?php echo app('translator')->getFromJson('language.yellow'); ?></span>
                        </li>
                        <li data-theme="amber">
                            <div class="amber"></div>
                            <span><?php echo app('translator')->getFromJson('language.amber'); ?></span>
                        </li>
                        <li data-theme="orange">
                            <div class="orange"></div>
                            <span><?php echo app('translator')->getFromJson('language.orange'); ?></span>
                        </li>
                        <li data-theme="deep-orange">
                            <div class="deep-orange"></div>
                            <span><?php echo app('translator')->getFromJson('language.deep_orange'); ?></span>
                        </li>
                        <li data-theme="brown">
                            <div class="brown"></div>
                            <span><?php echo app('translator')->getFromJson('language.brown'); ?></span>
                        </li>
                        <li data-theme="grey">
                            <div class="grey"></div>
                            <span><?php echo app('translator')->getFromJson('language.grey'); ?></span>
                        </li>
                        <li data-theme="blue-grey">
                            <div class="blue-grey"></div>
                            <span><?php echo app('translator')->getFromJson('language.blue_grey'); ?></span>
                        </li>
                        <li data-theme="black">
                            <div class="black"></div>
                            <span><?php echo app('translator')->getFromJson('language.black'); ?></span>
                        </li>
                    </ul>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="settings">
                    <div class="demo-settings">
                        <p>GENERAL SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Report Panel Usage</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Email Redirect</span>
                                <div class="switch">
                                    <label><input type="checkbox"><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                        <p>SYSTEM SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Notifications</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Auto Updates</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                        <p>ACCOUNT SETTINGS</p>
                        <ul class="setting-list">
                            <li>
                                <span>Offline</span>
                                <div class="switch">
                                    <label><input type="checkbox"><span class="lever"></span></label>
                                </div>
                            </li>
                            <li>
                                <span>Location Permission</span>
                                <div class="switch">
                                    <label><input type="checkbox" checked><span class="lever"></span></label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </aside>