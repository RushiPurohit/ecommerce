<?php $__env->startSection('content'); ?>
<div class="container-fluid">
            <!-- <div class="block-header">
                <h2><?php echo app('translator')->getFromJson('language.product'); ?></h2>
            </div> -->
 <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <?php echo $__env->make('Admin.errors.errorMessage', \Illuminate\Support\Arr::except(get_defined_vars(), array('__data', '__path')))->render(); ?>
            <div class="card">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.product'); ?> <a href="<?php echo e(URL::to('products/create')); ?>" class="pull-right btn btn-primary"><?php echo app('translator')->getFromJson('language.addValue'); ?> <?php echo app('translator')->getFromJson('language.productAlert'); ?></a>
                    </h2>
                </div> 
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover js-basic-example dataTable">
                            <thead>
                                <tr>
                                    <th><?php echo app('translator')->getFromJson('language.id'); ?></th>
                                    <th><?php echo app('translator')->getFromJson('language.productName'); ?></th>
                                    <th><?php echo app('translator')->getFromJson('language.productDescription'); ?></th>
                                    <th><?php echo app('translator')->getFromJson('language.tax'); ?></th>
                                    <!-- <th><?php echo app('translator')->getFromJson('language.price'); ?></th>
                                    <th><?php echo app('translator')->getFromJson('language.weight'); ?></th> -->
                                    <?php if(Auth::user()->id == 1){ ?>
                                        <th><?php echo app('translator')->getFromJson('language.status'); ?></th>
                                    <?php } ?>
                                    <th><?php echo app('translator')->getFromJson('language.action'); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php if(isset($products) and (count($products) > 0)): ?>
                                <?php 
                                    $i =1;
                                ?>
                                <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($i); ?></td>
                                        <!-- <td ><?php echo e($product->id); ?> </td> -->
                                        <td><?php echo e($product->product_name); ?></td>
                                        <td><?php echo $product->product_description; ?></td>
                                        <td><?php echo e($product->tax_id ? $product->getTax->tax_rate . ' %' : ''); ?></td>
                                        <!-- <td><?php echo e($product->price); ?></td>
                                        <td><?php echo e($product->weight); ?></td> -->
                                        <!-- <td><?php echo e(ucfirst($product->status ? 'Active' : 'Inactive')); ?></td> -->
                                        <?php if(Auth::user()->role_id != 2){ ?>
                                            <td>
                                                <div class="switch">
                                                    <label><input type="checkbox" onclick="customChangeStatus(this.value, <?php echo $product->id; ?>, 'products' )" value="<?php echo e($product->status); ?>" <?php if ($product->status == '1') {echo 'checked';}?> ><span class="lever" ></span></label>
                                                </div>
                                            </td>
                                        <?php } ?>
                                        <td width="15%" style="text-align: center;">
                                            <a href="<?php echo e(route('products.edit', ['id' => $product->id])); ?>"
                                           class="tool_tip"><i class="material-icons"  data-toggle="tooltip" data-placement="top" data-original-title="<?php echo e(__('language.edit')); ?>" >edit</i></a>
                                            <?php if($product->id): ?>
                                            <?php $route = URL::to('products/'.$product->id);
                                                        $token = csrf_token();
                                                    ?>
                                                    <a href="#" class="tool_tip"><i class="material-icons" onclick="deleteValue('<?php echo $route; ?>', this)"><i class="material-icons iconDelete"  data-toggle="tooltip" data-placement="top" data-original-title="<?php echo e(__('language.delete')); ?>">delete_forever</i></i></a>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php 
                                        $i++;
                                    ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php else: ?>
                                <!-- <tr><td colspan="3" align="center">record not found</td></tr> -->
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Basic Examples -->
</div>

<script>
    function confirmDelete() {
        return confirm("<?php echo __('language.deleteMessage'); ?>");
    }
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), array('__data', '__path')))->render(); ?>