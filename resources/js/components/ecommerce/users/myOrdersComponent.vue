<template>
	<div>
        <h2 class="fs-title">
            <img src="/ecommerce/img/title_icon1.png" alt="" title=""> 
             {{ $t('myOrders') }}
            <img src="/ecommerce/img/title_icon_mirror1.png" alt="" title="">
        </h2>
        <div class="my_orders my_profile">
        	<div class="detail_address_view" v-if="myOrders.length > 0">
				<div class="item" v-for="(order, index) in paginate " :key="index">
	                <div class="card">
	                    <div class="content_ship_address">
	                        <h4><b>	{{ $t('orderId') }} </b> <i> {{ order.order_number }} </i> </h4>
	                        <h4><b> {{ $t('orderDate') }} :</b> <i>{{ order.ordered_at }}</i></h4>
	                    </div>
	                    <div class="btn_shipping">
	                         <button type="button" @click="showOrderDetails(order.id)" class="btn btn-default btn-read" > {{ $t('orderDetails') }}
	                        </button>     
	                    </div>
	                </div>
	            </div>
				<div>
					<ul class="ul-class pagination_bottom">
						<li class="li-class" v-for="pageNumber in totalPages" :key="pageNumber">
						<a v-if="Math.abs(pageNumber - currentPage) < 3 || pageNumber == totalPages || pageNumber == 1" v-bind:key="pageNumber" @click="setPage(pageNumber)" :class="{current: currentPage === pageNumber, last: (pageNumber == totalPages && Math.abs(pageNumber - currentPage) > 3), first:(pageNumber == 1 && Math.abs(pageNumber - currentPage) > 3)}" class="paginate-button">{{ pageNumber }}</a>
						</li>
					</ul>
				</div>
	         </div>
			 <div v-else>
				 {{ $t('notFound') }}
			 </div>
        </div>
    </div>
</template>

<script>
import { mapState, mapGetters, mapMutations, mapActions } from "vuex";
export default {
	 computed: {
        totalPages: function() {
          return Math.ceil(this.resultCount / this.itemsPerPage)
        },
        paginate: function() {
            if (!this.myOrders || this.myOrders.length != this.myOrders.length) {
                return
            }
            this.resultCount = this.myOrders.length
            if (this.currentPage >= this.totalPages) {
              this.currentPage = this.totalPages
            }
            var index = this.currentPage * this.itemsPerPage - this.itemsPerPage
            return this.myOrders.slice(index, index + this.itemsPerPage)
        }
	},
	data () {
		return {
			myOrders: [],
			searchKey: '',
			currentPage: 1,
			itemsPerPage: 5,
			resultCount: 0
		}
	},
	created () {
		this.ACTION_CHANGE_MY_ACCOUNT_ACTIVE_CLASS('myOrders')
		this.getOrders()
	},
	
	methods: {
		...mapMutations([
			'SET_MY_ORDERS',
		]),
		...mapActions([
			'ACTION_CHANGE_MY_ACCOUNT_ACTIVE_CLASS',
		]),
		showOrderDetails(orderId) {
			this.$router.push({name: 'OrderDetailComponent', params: {id: orderId}})
		},
		getOrders () {
			this.$store.commit('SET_LOADING', true)
			axios.get('/api/orders', {
				headers: {
					Authorization: this.$session.get('accessToken')
				}
			})
			.then (reponse => {
				this.SET_MY_ORDERS = reponse.data.data
				this.myOrders = reponse.data.data
				this.$store.commit('SET_LOADING', false)
				this.setPage(1)
			})
		},
		setPage: function(pageNumber) {
          this.currentPage = pageNumber
		},
	},
	
}
</script>

<style>
.paginate-button {
  color: #999;
}
.current {
  color: red;
}
.ul-class {
  padding: 0;
  list-style-type: none;
}
.li-class {
  display: inline;
  margin: 5px 5px;
}

.paginate-button .first::after {
  content:'...'
}

.paginate-button .last::before {
  content:'...'
}
</style>
