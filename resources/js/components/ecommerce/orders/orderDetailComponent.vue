<template>
	<div id="genrate_pdf">
		<h2 class="fs-title">
            <img src="/ecommerce/img/title_icon1.png" alt="" title=""> 
              {{ $t('myOrders') }}
            <img src="/ecommerce/img/title_icon_mirror1.png" alt="" title="">
            <router-link to="/myAccount/myOrders" class="create_btn pull-right" > &lt; {{ $t('back') }}</router-link>
			<!-- <button class="create_btn pull-rigth" id="download_btn" @click="generatePDF">{{ $t('download') }}</button> -->
        </h2>
        <div class="my_orders my_profile" v-if="orderDetails != ''">
        	<div class="detail_address_view">
				<div class="item">
	                <div class="card">
	                    <div class="content_ship_address">
	                        <h4><b>	{{ $t('orderId') }}: </b> <i>{{ orderDetails.order_number }}</i> </h4>
	                        <h4><b> {{ $t('orderDate') }}:</b> <i>{{ orderDetails.ordered_at }}</i></h4>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="content_ship_address" style="padding-left:0px; padding-right:0px;">
                <div class="form_title">
                    <h2 class="fs-title"> {{ $t('shippingAddress') }}</h2>
               	</div>
               	<div class="table-responsive">
	                <table class="table table-striped confirm">
	                    <tbody>
	                        <tr>
	                            <td style="width:30%">{{ $t('name') }}</td>
	                            <td>{{ orderDetails.users.first_name }} {{ orderDetails.users.last_name }}</td>
	                        </tr>
	                        <tr>
	                            <td>{{ $t('address') }}</td>
	                            <td>{{ orderDetails.shippingAddress.address }}</td>
	                        </tr>
	                        <tr>
	                            <td>{{ $t('city') }}</td>
	                            <td>{{ orderDetails.shippingAddress.city }}</td>
	                        </tr>
	                        <tr>
	                            <td>{{ $t('mobile') }}</td>
	                            <td>{{ orderDetails.shippingAddress.mobile_number }}</td>
	                        </tr>
	                        <tr>
	                            <td>{{ $t('addressType') }}</td>
	                            <td>{{ orderDetails.shippingAddress.address_type }}</td>
	                        </tr>
	                        <tr>
	                            <td>{{ $t('landmark') }}</td>
	                            <td>{{ orderDetails.shippingAddress.landmark }}</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
            </div>
            <div class="text-left">
            	<div class="form_title">
                    <h2 class="fs-title"> {{ $t('productInfo') }} </h2>
               	</div>
	            <div class="table-responsive">
	                <table border="1" class="table table-striped table-hover order_place">
	                    <thead>
	                        <tr>
	                            <th class="text-center">{{$t('product')}}</th>
	                            <th>{{$t('name')}}</th>
	                            <th class="text-center">{{$t('quantity')}}</th>
	                            <th class="text-center">{{$t('price')}}</th>
	                            <th class="text-center">{{$t('total')}}</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr v-for="(order, index) in orderDetails.orderDetails" :key="index">
	                            <td style="width:20%">
	                                <div class="media">
	                                    <a class="thumbnail pull-left" href="#"> 
	                                    	<img class="media-object" :src="order.child_products.get_product.product_other_image[0]" > 
	                                   	</a>
	                                </div>
	                            </td>
	                            <td class="table_order" style="width:40%">
	                                <h4><a href="#">{{ $i18n.locale == 'ar' ? order.child_products.get_product.product_name_arabic : order.child_products.get_product.product_name }}</a></h4>
	                                <!-- <h5> by <a href="#">Brand name</a></h5> -->
	                            </td>
	                            <td class="Quanity" style="text-align: center ;width:10%">
	                                <strong>{{ order.quantity }}</strong>
	                            </td>
								
	                            <td class="text-center" style="width:10%"><strong>{{ $t('aed') }} {{ order.sub_total }}</strong></td>
	                            <td class="text-center" style="width:10%"><strong>{{ $t('aed') }} {{ order.grand_total }}</strong></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>

                <div class="order_summary_container">
                    <div class="coupon_code">
                        <p>{{ $t('subTotal') }}
                            <span class="amount">{{ $t('aed') }} {{ orderDetails.sub_total }}</span></p>
                        <p>{{ $t('shippingCharge') }}
                            <span>{{ $t('freeShipping') }}</span></p>
                        <p>{{ $t('discount') }}
                            <span class="amount"> {{ $t('aed') }} {{ orderDetails.discount }}</span></p>
						<p>{{ $t('paymentMethod') }}
                        	<span> {{ orderDetails.payment_method == '1' ? 'COD' : 'CARD' }}</span></p>
                        <p>{{ $t('total') }}
                            <span class="amount">{{ $t('aed') }} {{ orderDetails.grand_total }}</span></p>
                    </div>
                </div>
            </div>
	    </div>
	</div>
</template>

|<script>
import { mapState, mapMutations, mapGetters, mapActions } from "vuex";
import jsPDF from 'jspdf';
export default {
	computed: {
		...mapState([
			'myOrders'
		])
	},
	data () {
		return {
			orderDetails: '',
			imgData: '',
			imgData2: '',

		}
	},
	created () {
		this.ACTION_CHANGE_MY_ACCOUNT_ACTIVE_CLASS('myOrders')
		self = this
		setTimeout( function () {
			self.orderDetailsData()
		}, 1000)
	},
	methods: {
		...mapActions([
			'ACTION_CHANGE_MY_ACCOUNT_ACTIVE_CLASS',
		]),
		orderDetailsData () {
			axios.get('/api/orders/' + this.$route.params.id, {
				headers: {
					Authorization: this.$session.get('accessToken')
				}
			})
			.then (response => {
				this.orderDetails = response.data.data[0]
			})
		},
		generatePDF () {
			var image = '';
			var imgData = '';
			var base_url = window.location.origin
			var self = this
			
			this.toDataURL(base_url + '/ecommerce/img/title_icon1.png', function(dataUrl) {
				self.imgData = dataUrl
			})
			this.toDataURL(base_url + '/ecommerce/img/title_icon_mirror1.png', function(dataUrl) {
				self.imgData2 = dataUrl
			})
			setTimeout (function () {
				var doc = new jsPDF({
								orientation: 'p',
								unit: 'mm',
								format: 'a4',
								putOnlyUsedFonts:true
							})
				doc.setFontSize(18)
				doc.addImage(self.imgData, 'PNG', 75, 10)
				doc.text(90, 17, self.$t('myOrders'))
				doc.addImage(self.imgData2, 'PNG', 130, 10)
				// set colour to the reactacgle
				doc.setDrawColor(255, 0, 0)
				doc.setFillColor(220, 300, 200)
				doc.rect(20, 30, 170, 20, 'F')
				doc.setFontSize(14)
				doc.text(23, 38, self.$t('orderId')+ " : ")
				doc.text(47, 38, self.orderDetails.order_number)
				doc.text(23, 45, self.$t('orderDate')+ " : ")
				doc.text(53, 45, self.orderDetails.ordered_at)

				doc.text(20, 60, self.$t('shippingAddress'))
				
				// doc.rect(1, 60, 208, 20)
				// addImage(imageData, format, x, y, width, height, alias, compression, rotation)
				doc.save('test.pdf')
			}, 1000)
			
		},
		toDataURL(url, callback) {
			var xhr = new XMLHttpRequest();
			xhr.onload = function() {
				var reader = new FileReader();
				reader.onloadend = function() {
				callback(reader.result);
				}
				reader.readAsDataURL(xhr.response);
			};
			xhr.open('GET', url);
			xhr.responseType = 'blob';
			xhr.send();
		}
	}
}	
</script>