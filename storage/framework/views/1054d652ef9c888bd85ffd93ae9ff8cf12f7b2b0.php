<?php
    $segment = Request::segments();
?>
<aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <!-- <div class="user-info">
                <div class="image">
                    <img src="<?php echo e(URL::asset('adminLTE/images/user.png')); ?>" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo e(Auth::user() ? Auth::user()->first_name : ''); ?></div>
                    <div class="email"><?php echo e(Auth::user() ? Auth::user()->email : ''); ?></div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="<?php echo e(URL::to('logout')); ?>"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div> -->
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                <?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if(isset($value->child)): ?>
                    <?php
                    $active = '';
                    foreach ($value->child as $keyC => $valueC){
                        if($value->id == $valueC->parent_id && $segment[0] == $valueC->routes){
                            $active = 'active';
                            break;
                        }
                        
                    } ?>
                        <li class="<?php echo $active ?>">
                            <a href="javascript:void(0);" class="menu-toggle">
                                <i class="material-icons"><?php echo e($value->icon); ?></i>
                                <?php if(session::get('locale') == 'en'): ?>
                                <span><?php echo e($value->menu); ?></span>
                                <?php else: ?>
                                <span><?php echo e($value->menu_ar); ?></span>
                                <?php endif; ?>
                            </a>
                            <ul class="ml-menu">
                            <?php $__currentLoopData = $value->child; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $keyC => $valueC): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li>
                                <?php if($valueC->menu ): ?>
                                    <a href="<?php echo e(URL::to($valueC->routes)); ?>">
                                        <?php if(session::get('locale') == 'en'): ?>
                                            <span><?php echo e($valueC->menu); ?></span>
                                        <?php else: ?>
                                            <span><?php echo e($valueC->menu_ar); ?></span>
                                        <?php endif; ?>
                                    </a>
                                <?php endif; ?>
                                </li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </li>
                    <?php else: ?> 
                    <li class="<?php echo $segment[0] == $value->routes ? 'active' : '' ?>">
                        <a href="<?php echo e(URL::to($value->routes)); ?>">
                            <i class="material-icons"><?php echo e($value->icon); ?></i>
                                <?php if(session::get('locale') == 'en'): ?>
                                    <span><?php echo e($value->menu); ?></span>
                                <?php else: ?>
                                    <span><?php echo e($value->menu_ar); ?></span>
                                <?php endif; ?>
                        </a>
                    </li>
                    <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <!-- <div class="legal bg_legal">
                <div class="copyright">
                    &copy; 2019 - 2020 <a href="javascript:void(0);"><?php echo app('translator')->getFromJson('language.appName'); ?></a>.
                </div>
                <div class="version">
                    <b>Version: </b> 1.0.5
                </div>
            </div> -->
            <!-- #Footer -->
        </aside>