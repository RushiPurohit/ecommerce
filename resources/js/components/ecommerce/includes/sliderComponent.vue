<template>
    <div>
    	<div id="myCarousel" class="carousel slide home_slider" data-ride="carousel">
			  <!-- Indicators -->
			  <!-- <ol class="carousel-indicators">
			    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			    <li data-target="#myCarousel" data-slide-to="1"></li>
			  </ol> -->

			  <!-- Wrapper for slides -->
			  <div class="carousel-inner">
			    <div :class="{'item': true, 'active': index == 0}" v-for="(slide, index) in slider" :key="index">
			      <img :src="$i18n.locale == 'ar' ? slide.slider_image_arabic : slide.slider_image" alt="" title="" @click="changeRoute(slide.slider_option, slide.options)" class="pointer" />
			    </div>

			    <!-- <div class="item">
			      <img src="/ecommerce/img/slider2.jpg" alt="" title="">
			    </div> -->
			  </div>

			  <!-- Left and right controls -->
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left">
			    	<img src="/ecommerce/img/slider_arrow_left.png" alt="" title="">
				</span>
			  </a>
			  <a class="right carousel-control" href="#myCarousel" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right">
			    	<img src="/ecommerce/img/slider_arrow_right.png" alt="" title="">
				</span>
			  </a>
			</div>
         <!-- End slider area -->
    </div>
</template>

<script>
import { mapMutations, mapState, mapGetters, mapActions } from 'vuex';
export default {
	computed: {
        ...mapState([
			'slider',
			'getLocale',
        ]),
         ...mapGetters([
            'cartCount',
        ]),
	},
	 methods: {
		changeRoute (type, id) {
			if (type == 'category') {
				this.$router.push('/categories/'+ btoa(id))
			} else {
				this.$router.push('/product-details/'+ id)
			}
		}
	 }
}
</script>

<style scopped>
	.pointer {
		cursor: pointer;
	}
</style>
