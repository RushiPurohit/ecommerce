<template>
    <div>
        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>{{ $t('category') }}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End Page title area -->

        <!-- <div class="col-sm-md-12">
            <div class="single-product-area">
                <div class="zigzag-bottom"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-6" v-for="(product, index) in searchResult" :key="index">
                            <div class="single-shop-product">
                                <div class="product-upper">
                                    <img :src="product.product_other_image[0]" alt="">
                                </div>
                                <h2><a @click="$parent.setImage(product.product_other_image[0], product.id)">{{ $i18n.locale == 'ar' ?product.product_name_arabic : product.product_name }}</a></h2>
                                <div class="product-carousel-price">
                                    <ins>{{ $t('aed') }} {{product.sale_price ? product.sale_price : product.price}}</ins> <del>{{ $t('aed') }} {{ product.price }}</del>
                                </div>  
                                
                                <div class="product-option-shop">
                                    <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow"  @click="$parent.addToCart(product.id, product.sale_price ? product.sale_price : product.price)">{{ $t('addToCart') }}</a>
                                </div>                       
                            </div>
                        </div>
                    </div> -->
                    
                    <!-- <div class="row">
                        <div class="col-md-12">
                            <div class="product-pagination text-center">
                                <nav>
                                <ul class="pagination">
                                    <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                    </li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                    </li>
                                </ul>
                                </nav>                        
                            </div>
                        </div>
                    </div> -->
                <!-- </div>
            </div>
        </div> -->

        <!-- Start Category page  -->
        <!-- <div class="feature_product category_page">
            <div class="container">
                <div class="item" v-for="(cat, index) in categoryDetails " :key="index">
                    <div class="inner_product">
                        <div class="product_img">
                            <a @click="productDetail = cat.get_porduct"><img :src="cat.category_image" alt="" title="" class="image" >
                            <div class="middle">
                                <div class="inner_middle">
                                    <img  src="/ecommerce/img/almonds_overlay.png" alt="" title="" class="text" >
                                    <h3 class="text">{{ getLocale == 'ar' ? cat.category_name_arabic : cat.category_name }}</h3>
                                </div>
                            </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>     -->

      <!-- End Category -->


        <!-- start search product -->
             <div class="feature_product"  id="accordion">
            <div class="container product_Sidebar" id="feature_slider" >
                <div class="left_sidebar">
                    <div class="inner_siderbar">
                    <label > {{ $t('category') }}</label>
                    <ul>
                        <li v-for="(cat, index) in sideCategory " :key="index">
                           <a v-if="cat.parent_category == 0" @click="productDetail = cat.get_porduct, tempProductDetail = cat.get_porduct" data-toggle="collapse" data-parent="#accordion" :href="'#collapse'+index" >{{ getLocale == 'ar' ? cat.category_name_arabic : cat.category_name }} <span v-if="cat.childCategory.length > 0" class="caret"></span></a> 
                           <ul v-if="cat.childCategory.length > 0" :id="'collapse'+index" class="collapse sub_categories">
                               <li v-for="(subCat, index) in cat.childCategory " :key="index" @click="productDetail = subCat.get_porduct, tempProductDetail = subCat.get_porduct"><a >{{ getLocale == 'ar' ? subCat.category_name_arabic : subCat.category_name }}</a></li>
                            </ul>
                        </li>
                    </ul>
                    </div>

                    <!-- <div class="inner_siderbar">
                        <label > Brands</label>
                        <ul>
                            <li>
                            <input type="checkbox"> 
                            <span>ABBBA</span>
                            <span>(1211)</span>
                            </li>
                            <li>
                            <input type="checkbox"> 
                            <span>ABBBA</span>
                            <span>(1211)</span>
                            </li>
                            <li>
                            <input type="checkbox"> 
                            <span>ABBBA</span>
                            <span>(1211)</span>
                            </li>
                            
                        </ul>
                    </div> -->

                     <div class="inner_siderbar3">
                    <label > {{ $t('price') }} ({{ $t('aed') }})</label>
                     <ul>
                        <li>
                         <input type="number" value="13" name="min" v-model="priceTo" class="textInput"> 
                          <span>{{ $t('to') }}</span>
                          <input type="number" value="13" name="min" v-model="priceFrom" class="textInput"> 
                          <button type="button" @click="filterPrice">{{ $t('go') }}</button>
                        </li>
                    </ul>
                    </div>
                </div>
                <div class="content_area_side" v-if="productDetail.length > 0"> 
                    <div class="search_item" v-for="(product, index) in productDetail" :key="index">
                        <div class="inner_product" v-if="product.status == '1'">
                            <div class="product_img">
                                <a @click="setImage(product.product_other_image[0], product.id)"> <img :src="product.product_other_image[0]" alt=""></a>
                            </div>
                            <h4><a @click="setImage(product.product_other_image[0], product.get_child_product[0].id)">{{ GET_PRODUCT_SHORT_NAME($i18n.locale == 'ar' ?product.product_name_arabic : product.product_name) }}</a></h4>
                            <!-- <div class="star_rating">
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="fas fa-star"></i></a>
                                <a href="#"><i class="far fa-star"></i></a>
                                <a href="#"><i class="far fa-star"></i></a>
                            </div> -->
                            <h3 class="price_tag">
                                <span class="price line_above">{{ $t('aed') }} {{ product.get_child_product[0].price }}</span>
                                <span class="discount_price">({{ $t('aed') }} {{ product.get_child_product[0].sale_price ? product.get_child_product[0].sale_price : product.get_child_product[0].price }})</span>
                            </h3>
                            <div class="all_btn">
                                <!-- <router-link :to="'/product-details/' + product.id"><span><i class="fas fa-heart"></i></span></router-link> -->
                                <a @click="addToCart(product.get_child_product[0].id, product.get_child_product[0].sale_price ? product.get_child_product[0].sale_price : product.get_child_product[0].price)"><span><i class="fas fa-shopping-cart"></i></span></a>
                                <a @click="setImage(product.product_other_image[0], product.get_child_product[0].id)"><span><i class="fas fa-eye"></i></span></a>
                            </div>
                        </div>
                    </div> 
                </div>  
                <div v-else>
                    {{ $t('noResultFound') }}
                </div>
            </div>
        </div>
          
          <!-- End search product -->
        
    </div>
</template>

<script>
import { mapMutations, mapState, mapGetters, mapActions } from 'vuex';
import HomeComponent from "../homeComponent";
export default {
    extends: HomeComponent,
    computed: {
        ...mapState([
            'isActive',
            'products',
            'searchResult',
            'menuItems',
            'getLocale',
        ]),
        ...mapGetters([
            'GET_PRODUCT_SHORT_NAME',
        ])
    },
    data () {
        return {
            productKey: 0,
            productDetail: [],
            tempProductDetail: [],
            allCategories: [],
            categoryDetails: [],
            sideCategory: [],
            priceTo: 0,
            priceFrom: 100,
        }
    },
    created () {
        this.setIsActive()
        this.productDetails()
    },
    watch: {
        '$route.params.id': function (id) {
            this.productDetails()
        }
    },
    methods: {
        ...mapMutations([
            'SET_SEARCH_RESULT',
        ]),
        ...mapActions([
            'SET_CART',
            'ACTION_ACTIVE_CLASS',
            'ACTION_SET_IMAGE',
        ]),
        setIsActive () {
            var currentUrl = window.location.pathname;
            this.ACTION_ACTIVE_CLASS('category')
            
        },
        productDetails() {
            if (this.$route.params.id) {
                var categoryId = atob(this.$route.params.id)
                if (Number.isInteger(parseInt(categoryId))) {
                    categoryId = atob(this.$route.params.id)
                } else {
                    categoryId = this.$route.params.id
                }
                axios.get('/api/categories')
                .then (response => {
                    this.sideCategory = response.data.data
                    this.allCategories = response.data.allcategory
                    var categoryDetails = [];
                    var productDetail = []
                    this.allCategories.filter( function (elem) {
                        if(elem.id == categoryId || elem.parent_category == categoryId || elem.category_name.toLowerCase() == categoryId.toLowerCase()) {
                            categoryDetails.push(elem)
                            productDetail.push(elem.get_porduct)
                        }
                    });
                    this.categoryDetails = categoryDetails
                    var prod = []
                    productDetail.forEach(element => {
                        element.forEach(el => {
                            prod.push(el)
                        });
                    });
                    this.tempProductDetail = prod
                    this.productDetail = prod
                })
                // axios.post('/api/search', {
                //     search: this.$route.params.id
                // })
                // .then(response => {
                //     this.SET_SEARCH_RESULT(response.data.data)
                // })
            }
        },
        filterPrice () {
            var changesProduct = []
            this.tempProductDetail.forEach(element => {
                // console.log(element.get_child_product)
                element.get_child_product.forEach(childElement => {
                    // console.log(childElement.price, childElement.sale_price, this.priceTo, this.priceFrom)
                    var mainPrice = childElement.sale_price != '' ? childElement.sale_price : childElement.price
                    if (mainPrice >= parseInt(this.priceTo) && mainPrice <= parseInt(this.priceFrom)) {
                        changesProduct.push({product_name: element.product_name, product_name_arabic: element.product_name_arabic, product_other_image: element.product_other_image, id: element.id, get_child_product: [childElement] })
                    }
                });
            });
            this.productDetail = []
            this.productDetail = changesProduct
        }
    }
}
</script>

<style>

</style>
