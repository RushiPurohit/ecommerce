<?php $__env->startSection('content'); ?>
<script>
//Here Form validation [Start]
$(document).ready(function()
{
    $('#form').formValidation({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
		fields: {	
                product_name: 
                {
                    message: '<?php echo __('language.productName_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.productName_required'); ?>'},
                        }
                },
                product_name_arabic: 
                {
                    message: '<?php echo __('language.productName_arabic_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.productName_arabic_required'); ?>'},
                        }
                },
                product_code: 
                {
                    message: '<?php echo __('language.productCode_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.productCode_required'); ?>'},
                        }
                },
                category: 
                {
                    message: '<?php echo __('language.category_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.category_required'); ?>'},
                        }
                },
                <?php if(Auth::user()->id != 1){ ?>
                status: 
                {
                    message: '<?php echo __('language.status_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.status_required'); ?>'},                           
                        }
                },
                <?php } ?>
                productImage: 
                {
                    message: '<?php echo __('language.productImage_required'); ?>',
                    validators: 
                        {
                            notEmpty:{message: '<?php echo __('language.productImage_required'); ?>'},
                           
                        }
                },
                	
					
		}
    });
});
//Here Form validation [End]
</script>
<div class="container-fluid">
            <!-- <div class="block-header">
                <h2><?php echo app('translator')->getFromJson('language.product'); ?></h2>
            </div> -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <!-- card Start -->
            <?php echo Form::open(['route' => 'products.store', 'files'=> true, 'id' => 'form', 'name' => 'form', 'autocomplete' => 'off']); ?>

            <div class="card">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.add'); ?> <?php echo app('translator')->getFromJson('language.productAlert'); ?>
                        <a href="/products" class="btn btn-primary btn_save pull-right"><?php echo app('translator')->getFromJson('language.back'); ?></a> 
                    </h2>
                </div>
                <div class="body">
                <?php echo $__env->make('Admin.errors.errorMessage', \Illuminate\Support\Arr::except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                    
                        <div class="row clearfix">
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('product_name') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::text('product_name', null ,['class'=>'form-control', 'placeholder' => __('language.productName'), 'required' => true]); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('product_name')); ?></small>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('product_name_arabic') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::text('product_name_arabic', null ,['class'=>'form-control', 'placeholder' => __('language.productNameArabic')]); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('product_name_arabic')); ?></small>
                                </div>
                            </div>
                        </div>


                        <div class="row clearfix">
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('product_description') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::textarea('product_description', null ,['class'=>'form-control', 'placeholder' => __('language.productDescription'), 'rows'=>3, 'required' => true, 'id' => 'article-ckeditor']); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('product_description')); ?></small>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('product_description_arabic') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::textarea('product_description_arabic', null ,['class'=>'form-control', 'placeholder' => __('language.productDescriptionArabic'), 'rows'=>3, 'id' => 'article-ckeditor1']); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('product_description_arabic')); ?></small>
                                </div>
                            </div>
                        </div>

                        <div class="row clearfix">
                            <div class="col-sm-6">
                            <div class="form-group<?php echo e($errors->has('product_code') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::text('product_code', null ,['class'=>'form-control', 'placeholder' => __('language.productCode'), 'required' => true]); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('product_code')); ?></small>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('category') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::select('category', $category, null ,['class'=>'form-control', 'placeholder' => __('language.select').' '.__('language.category'), 'required' => true]); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('category')); ?></small>
                                </div>
                            </div>
                        </div>


                        <div class="row clearfix">
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('tax') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                    <?php echo Form::select('tax', $tax, null ,['class'=>'form-control', 'placeholder' => __('language.select').' '.__('language.tax')]); ?>

                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('tax')); ?></small>
                                </div>
                            </div>
                            <?php if(Auth::user()->role_id != 2){ ?>
                                <div class="col-sm-6">
                                    <div class="form-group<?php echo e($errors->has('status') ? ' has-error' : ''); ?>">
                                        <div class="form-line">
                                        <?php echo Form::select('status', [ 1 => __('language.active'), 0 => __('language.inactive')], null ,['class'=>'form-control', 'placeholder' => __('language.select').' '.__('language.status'), 'required' => true]); ?>

                                        </div>
                                        <small class="text-danger"><?php echo e($errors->first('status')); ?></small>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>

                        <!-- Checkbox for product latest and futured -->
                        <div class="row clearfix">
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('is_latest') ? ' has-error' : ''); ?>">
                                    <div class="col-sm-3">
                                        <div class="">
                                            <label> <?php echo app('translator')->getFromJson('language.isLatest'); ?> </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="switch">
                                        
                                            <label>
                                                <?php echo app('translator')->getFromJson('language.no'); ?>
                                                    <?php echo Form::checkbox('is_latest',null); ?>

                                                    <span class="lever" ></span>
                                                <?php echo app('translator')->getFromJson('language.yes'); ?>
                                            </label>
                                            <!-- <label>OFF<input type="checkbox" checked=""><span class="lever"></span>ON</label> -->
                                        </div>
                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('is_latest')); ?></small>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group<?php echo e($errors->has('is_futured') ? ' has-error' : ''); ?>">
                                    <div class="col-sm-3">
                                        <div class="">
                                            <label> <?php echo app('translator')->getFromJson('language.isFeatured'); ?> </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="switch">
                                            <label>
                                                <?php echo app('translator')->getFromJson('language.no'); ?>
                                                    <?php echo Form::checkbox('is_futured',null); ?>

                                                    <span class="lever" ></span>
                                                <?php echo app('translator')->getFromJson('language.yes'); ?>
                                            </label>
                                        </div>
                                    </div>
                                    <small class="text-danger"><?php echo e($errors->first('is_futured')); ?></small>
                                </div>
                            </div>
                        </div>


                        <div class="row clearfix">
                            <div class="col-sm-3">
                                <div class="form-group<?php echo e($errors->has('attribute') ? ' has-error' : ''); ?>">
                                <label for=""><?php echo app('translator')->getFromJson('language.productImage'); ?></label>
                                    <div id="filediv">
                                        <!-- <input name="file[]" type="file" id="file"/> -->
                                        <input type="file" id="file" name="product_image[]" accept=".gif, .jpg, .png" required>
                                    </div>                                    
                                    <button type="button" class="btn btn-warning" id="add_more"><?php echo app('translator')->getFromJson('language.addMoreImage'); ?></button>
                                </div>
                            </div>
                        </div>
                        
            

            <div class="card">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.productAlert'); ?> <?php echo app('translator')->getFromJson('language.attributes'); ?></h2>
                    <div class="form-group">
                        <button type="button" class="btn btn-primary add_more_button pull-right" ><?php echo app('translator')->getFromJson('language.addValue'); ?></button>
                    </div>
                </div>
                <div class="body">
                    <!-- start -->
                    <div class="row clearfix">
                            <?php $__currentLoopData = $attributes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <div class="form-line">
                                        <select class="form-control" name="attribute_0[]">
                                            <option value=""><?php echo app('translator')->getFromJson('language.select'); ?> <?php echo e(app()->getLocale() == 'ar' ? $value->attribute_arabic : $value->attribute); ?></option>
                                            <?php $__currentLoopData = $value->childAttribute; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $keys => $values): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($values->id); ?>"><?php echo e($values->value); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <div class="col-sm-3">
                                <div class="form-group<?php echo e($errors->has('price') ? ' has-error' : ''); ?>">                                
                                    <div class="form-line">
                                        <?php echo Form::text('price_0', null ,['class'=>'form-control', 'placeholder' => __('language.price'), 'min' => 0, 'required' => true]); ?>

                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group<?php echo e($errors->has('price') ? ' has-error' : ''); ?>">
                                    <div class="form-line">
                                        <?php echo Form::text('sale_price_0', null ,['class'=>'form-control', 'placeholder' => __('language.salePrice'), 'min' => 0]); ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end -->
                    <div>
                
                    </div>
                </div>
            </div>


            <!-- for multiple attributes -->
            <div class="input_fields_container">
            </div>
            


            <div class="card">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.productAlert'); ?> <?php echo app('translator')->getFromJson('language.specification'); ?></h2>
                </div>
                <div class="body">
                    <!-- start -->                    
                    <div class="row clearfix">
                        <div class="col-sm-2">
                            <div class="form-group<?php echo e($errors->has('key_0') ? ' has-error' : ''); ?>">
                                <div class="form-line">
                                <?php echo Form::text('key_0', null,['class'=>'form-control', 'placeholder' => __('language.key')]); ?>

                                </div>
                                <small class="text-danger"><?php echo e($errors->first('key_0')); ?></small>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group<?php echo e($errors->has('key_0') ? ' has-error' : ''); ?>">
                                <div class="form-line">
                                <?php echo Form::text('key_arabic_0', null,['class'=>'form-control', 'placeholder' => __('language.keyArabic')]); ?>

                                </div>
                                <small class="text-danger"><?php echo e($errors->first('key_arabic_0')); ?></small>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group<?php echo e($errors->has('value_0') ? ' has-error' : ''); ?>">
                                <div class="form-line">
                                <?php echo Form::text('value_0', null,['class'=>'form-control', 'placeholder' => __('language.value')]); ?>

                                </div>
                                <small class="text-danger"><?php echo e($errors->first('value_0')); ?></small>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="form-group<?php echo e($errors->has('value_arabic_0') ? ' has-error' : ''); ?>">
                                <div class="form-line">
                                <?php echo Form::text('value_arabic_0', null,['class'=>'form-control', 'placeholder' => __('language.valueArabic')]); ?>

                                </div>
                                <small class="text-danger"><?php echo e($errors->first('value_arabic_0')); ?></small>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="form-group">
                                <button type="button" class="btn btn-primary add_more_button_specification pull-right" ><?php echo app('translator')->getFromJson('language.addValue'); ?></button>
                        </div>
                    </div>
                         
                            
                        </div>
                        <!-- end -->
                        <!-- for multiple specification -->
                        <div class="input_fields_container_specification">
                        </div>
                </div>
            </div>

            
            <div class="row clearfix">
                <div class="col-sm-12">
                    <button type="submit" class="btn btn-primary pull-right btn_save"><?php echo app('translator')->getFromJson('language.save'); ?></button>
                    <button type="reset" class="btn blue_btn pull-right spacebetween btn_edit"><?php echo app('translator')->getFromJson('language.reset'); ?></button>
                </div>
            </div>
            </div>
            <?php echo Form::close(); ?>

            <!-- card End -->
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    var max_fields_limit      = 100; //set limit for maximum input fields
    var x = 1; //initialize counter for text box
    var y = 1;
    $('.add_more_button').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
        $('.input_fields_container').append('<div class="card"> <div class="header"><h2><?php echo app('translator')->getFromJson('language.productAlert'); ?> <?php echo app('translator')->getFromJson('language.attributes'); ?></h2> <div class="form-group"> <button type="button" class="btn btn-danger remove_field add_more_button pull-right" ><?php echo app('translator')->getFromJson('language.removeValue'); ?></button> </div> </div> <div class="body"> <div class="row clearfix"> <?php foreach ($attributes as $key => $value){?> <div class="col-sm-3"> <div class="form-group"> <div class="form-line"> <select class="form-control" name="attribute_'+x+'[]"> <option value=""><?php echo app('translator')->getFromJson('language.select'); ?> <?php echo app()->getLocale() == 'ar' ? $value->attribute_arabic : $value->attribute; ?></option> <?php foreach ($value->childAttribute as $keys => $values) { ?> <option value="<?php echo e($values->id); ?>"><?php echo e($values->value); ?></option> <?php } ?> </select> </div> </div> </div> <?php } ?><div class="col-sm-3"> <div class="form-group"> <div class="form-line"> <input class="form-control" placeholder="<?php echo app('translator')->getFromJson('language.price'); ?>" name="price_'+x+'" type="text" min="0" required> </div> </div> </div><div class="col-sm-3"> <div class="form-group"> <div class="form-line"> <input class="form-control" placeholder="<?php echo app('translator')->getFromJson('language.salePrice'); ?>" name="sale_price_'+x+'" type="text" min="0"> </div> </div> </div> </div> </div></div> </div>'); //add input field
            x++;
        }

        $('.input_fields_container').on("click",".remove_field", function(e){ //user click on remove text links
            e.preventDefault(); $(this).parent().parent().parent().remove(); x--;
        })
    });

    $('.add_more_button_specification').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
            $('.input_fields_container_specification').append('<div class="row clearfix"><div class="col-sm-2"><div class="form-group"><div class="form-line"><input class="form-control" placeholder="<?php echo app('translator')->getFromJson('language.key'); ?>" name="key_'+y+'" type="text"></div><small class="text-danger"></small></div></div><div class="col-sm-2"><div class="form-group"><div class="form-line"><input class="form-control" placeholder="<?php echo app('translator')->getFromJson('language.keyArabic'); ?>" name="key_arabic_'+y+'" type="text"></div><small class="text-danger"></small></div></div><div class="col-sm-2"><div class="form-group"><div class="form-line"><input class="form-control" placeholder="<?php echo app('translator')->getFromJson('language.value'); ?>" name="value_'+y+'" type="text"></div><small class="text-danger"></small></div></div><div class="col-sm-2"><div class="form-group"><div class="form-line"><input class="form-control" placeholder="<?php echo app('translator')->getFromJson('language.valueArabic'); ?>" name="value_arabic_'+y+'" type="text"></div><small class="text-danger"></small></div></div><div class="col-sm-2"><div class="form-group"><button type="button" class="btn btn-danger remove_field add_more_button pull-right" ><?php echo app('translator')->getFromJson('language.removeValue'); ?></button></div></div></div>');
            y++;
        }

        $('.input_fields_container_specification').on("click",".remove_field", function(e){ //user click on remove text links
            e.preventDefault(); $(this).parent().parent().parent().remove(); y--;
        })
    });


});
</script>

<script>
    var abc = 0; // Declaring and defining global increment variable.
    $(document).ready(function() {
        $('#add_more').hide(); // hide add more product image button on click
        //  To add new input file field dynamically, on click of "Add More Files" button below function will be executed.
        $('#add_more').click(function() {
            $(this).before($("<div/>", {
                id: 'filediv'
            }).fadeIn('slow').append($("<input/>", {
                name: 'product_image[]',
                type: 'file',
                id: 'file',
                required: true
            }), $("<br/><br/>")));
            $('#add_more').hide(); // hide add more product image button on click
        });
        // Following function will executes on change event of file input to select different file.
        $('body').on('change', '#file', function() {
            if (this.files && this.files[0]) {
                abc += 1; // Incrementing global variable by 1.
                var z = abc - 1;
                var x = $(this).parent().find('#previewimg' + z).remove();
                $(this).before("<div id='abcd" + abc + "' class='abcd'><img id='previewimg" + abc + "' src=''/></div>");
                var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
                $(this).hide();
                $("#abcd" + abc).append($("<img/>", {
                    id: 'img',
                    src: "<?php echo e(URL::asset('stop.png')); ?>",
                    alt: 'delete'
                }).click(function() {
                    $(this).parent().parent().remove();
                }));
            }
            $('#add_more').show(); // show add more product image button on click
        });
        // To Preview Image
        function imageIsLoaded(e) {
            $('#previewimg' + abc).attr('src', e.target.result);
        };
        $('#upload').click(function(e) {
            var name = $(":file").val();
            if (!name) {
                alert("First Image Must Be Selected");
                e.preventDefault();
            }
        });
    });
</script>
<script>
    CKEDITOR.replace( 'article-ckeditor' );
    CKEDITOR.replace( 'article-ckeditor1' );
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), array('__data', '__path')))->render(); ?>