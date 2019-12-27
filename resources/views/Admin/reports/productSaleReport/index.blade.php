@extends('layouts.app')

@section('content')
<div class="container-fluid">            
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">            
            <div class="card">
                <input type="hidden" id="productSales" value="{{ $productSale }}">
                <div class="header">
                    <h2>@lang('language.productSaleChart')</h2>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>                            
                        </li>
                    </ul>
                </div>
                <div class="body">
                    <canvas id="bar_chart2" height="150"></canvas>
                </div>
            </div>           
        </div>
    </div>    
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
                        label: "Total Product Sale",
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
@endsection
