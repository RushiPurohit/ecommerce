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
      <!-- Start Category page  -->
        <div class="feature_product category_page">
            <div class="container">
                <div class="item" v-for="(cat, index) in category " :key="index">
                    <div class="inner_product">
                        <div class="product_img">
                            <a @click="chnageRoute(cat.id, cat.parent_category, cat.category_name)"><img :src="cat.category_image" alt="" title="" class="image" >
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
        </div>    

      <!-- End Category -->

    </div>
</template>

<script>
import { mapState, mapMutations, mapGetters, mapActions } from "vuex";
export default {
    computed: {
        ...mapState([
            'getLocale'
        ])
    },
    data () {
        return {
            category: [],
        }
    },
    created () {
        this.getCategory()
        this.setIsActive()
    },
    methods: {
        ...mapActions([
            'ACTION_ACTIVE_CLASS',
        ]),
        getCategory () {
            axios.get('/api/allCategories')
            .then (response => {
                this.category = response.data.data
            })
        },
        setIsActive () {
            var currentUrl = window.location.pathname;
            this.ACTION_ACTIVE_CLASS('category')
        },
        chnageRoute (categoryId, categoryParent, categoryName) {
            if (categoryParent == 0) {
                var a = btoa(parseInt(categoryId))
                this.$router.push({name: 'SubCategoryComponent', params: {id: a}})
            } else {
                this.$router.push({name: 'SubCategoryComponent', params: {id: categoryName}})
            }
        },
    }
}
</script>

<style>

</style>
