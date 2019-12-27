 <?php $__env->startSection('content'); ?>
<div class="container-fluid">
    <div class="block-header">
        <h2><?php echo app('translator')->getFromJson('language.dashboard'); ?></h2>
    </div>

    <!-- Widgets -->
    <div class="row clearfix">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-pink hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">playlist_add_check</i>
                </div>
                <div class="content">
                    <div class="text"><?php echo app('translator')->getFromJson('language.product'); ?></div>
                    <div class="number count-to" data-from="0" data-to="125" data-speed="15" data-fresh-interval="20"><?php echo e($productCount); ?></div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-cyan hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">shopping_cart</i>
                </div>
                <div class="content">
                    <div class="text"><?php echo app('translator')->getFromJson('language.order'); ?></div>
                    <div class="number count-to" data-from="0" data-to="257" data-speed="1000" data-fresh-interval="20"><?php echo e($orderCount); ?></div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-light-green hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">input</i>
                </div>
                <div class="content">
                    <div class="text"><?php echo app('translator')->getFromJson('language.user'); ?></div>
                    <div class="number count-to" data-from="0" data-to="243" data-speed="1000" data-fresh-interval="20"><?php echo e($userCount); ?></div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <div class="info-box bg-orange hover-expand-effect">
                <div class="icon">
                    <i class="material-icons">apps</i>
                </div>
                <div class="content">
                    <div class="text"><?php echo app('translator')->getFromJson('language.totalSeller'); ?></div>
                    <div class="number count-to" data-from="0" data-to="1225" data-speed="1000" data-fresh-interval="20"><?php echo e($sellerCount); ?></div>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Widgets -->
    <div class="row">
    <?php if(Auth::user()->role_id == 1): ?>
    <!-- Bar Chart -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <input type="hidden" id="sales" value="<?php echo e($orderChart); ?>">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.totalAmountChart'); ?></h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <!-- <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul> -->
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="bar_chart1" height="150"></canvas>
                </div>
            </div>
        </div>
    <!-- #END# Bar Chart -->
    <?php endif; ?>
    <!-- Bar Chart -->
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <input type="hidden" id="productSales" value="<?php echo e($productSale); ?>">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.productSaleChart'); ?></h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <!-- <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul> -->
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="bar_chart2" height="150"></canvas>
                </div>
            </div>
        </div>
    <!-- #END# Bar Chart -->
    </div>
    <?php if(Auth::user()->role_id == 1): ?>
    <!-- Bar Chart -->
    <div class="row">
    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="card">
                <input type="hidden" id="panymentChart" value="<?php echo e($panymentChart); ?>">
                <div class="header">
                    <h2><?php echo app('translator')->getFromJson('language.totalTtransactionChart'); ?></h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <!-- <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul> -->
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="pie_chart" height="150"></canvas>
                </div>
            </div>
        </div>
    <!-- #END# Bar Chart -->
    </div>
<?php endif; ?>
    
</div>
<script>
    new Chart(document.getElementById("bar_chart2").getContext("2d"), getHomeChartJs('bar'));
    function getHomeChartJs (type) {
        var sales1 = document.getElementById('productSales').value
        var saleArray = JSON.parse(sales1)
        var month1 = []
        var totalProduct = []
        saleArray.forEach(element => {
            month1.push(element.new_date)
            totalProduct.push(element.total_product)            
        });
        config = {
            type: 'bar',
            data: {
                labels: month1,
                datasets: [
                    {
                        label: "<?php echo e(__('language.totalProductSale')); ?>",
                        data: totalProduct,
                        backgroundColor: 'rgba(0, 188, 212, 0.8)'
                    }, 
                ]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
        return config;
    }
    
</script>

<script>
    new Chart(document.getElementById("bar_chart1").getContext("2d"), getChartJs1('bar'));
        function getChartJs1 (type) {
        var sales2 = document.getElementById('sales').value
        var saleArray = JSON.parse(sales2)
        var month = []
        var totalOrder = []
        var totalAmount = []
        saleArray.forEach(element => {
            month.push(element.new_date)
            totalOrder.push(element.total_order)
            totalAmount.push(element.grand_total)
        });
        config = {
            type: 'bar',
            data: {
                labels: month,
                datasets: [
                    {
                        label: "<?php echo e(__('language.saleAmount')); ?>",
                        data: totalAmount,
                        backgroundColor: 'rgba(0, 188, 212, 0.8)'
                    }, 
                    {
                        label: "<?php echo e(__('language.totalOrder')); ?>",
                        data: totalOrder,
                        backgroundColor: 'rgba(233, 30, 99, 0.8)'
                    }
                ]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
        return config;
    }
    
</script>

<script>
    new Chart(document.getElementById("pie_chart").getContext("2d"), getChartJs('pie'));
    function getChartJs (type) {
        var sales3 = document.getElementById('panymentChart').value
        var saleArray = JSON.parse(sales3)
        var month = []
        var cash = []
        var card = []
        saleArray.forEach(element => {
            cash = element.cash
            card = element.card
        });
        config = {
            type: 'pie',
            data: {
                datasets: [{
                    data: [cash, card],
                    backgroundColor: [
                        "rgb(233, 30, 99)",
                        "rgb(255, 193, 7)",
                        "rgb(0, 188, 212)",
                        "rgb(139, 195, 74)"
                    ],
                }],
                labels: ["<?php echo e(__('language.cash')); ?>", "<?php echo e(__('language.card')); ?>"]
            },
            options: {
                responsive: true,
                legend: false
            }
        }
        return config;
    }
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), array('__data', '__path')))->render(); ?>