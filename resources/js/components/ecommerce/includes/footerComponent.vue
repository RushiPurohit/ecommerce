<template>
    <div>
        <div class="footer-top-area">
            <div class="container">
                <div class="row">
                    <div class="footer_colum">
                        <div class="footer-about-us">
                            <img src="/ecommerce/img/logo_footer.png" alt="" title="">
                            <p>Lorem ipsum dolor amet cons adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>
                            <div class="footer-social">
                                <a href="#" target="_blank" title="Facebook"><i class="fab fa-facebook-f"></i></a>
                                <a href="#" target="_blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                <a href="#" target="_blank" title="Google Plus"><i class="fab fa-google-plus-g"></i></a>
                                <a href="#" target="_blank" title="Linked In"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="footer_colum">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">
                                <img src="/ecommerce/img/f_title_icon.png" alt="" title=""> &nbsp;  
                                {{ $t('menu') }} &nbsp;
                                <img src="/ecommerce/img/f_title_icon_mirror.png" alt="" title="">
                            </h2>
                            <ul>
                                <li><router-link to="/">{{ $t('home') }}</router-link></li>
                                <li><router-link to="/">{{ $t('about') }}</router-link></li>
                                <li><router-link to="/categories">{{ $t('category') }}</router-link></li>
                                <li><router-link to="/">{{ $t('contactUs') }}</router-link></li>
                                <li><a @click="openPopup">{{ $t('sellerRegitration') }}</a></li>
                            </ul>                        
                        </div>
                    </div>
                    
                    <div class="footer_colum">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">
                                <img src="/ecommerce/img/f_title_icon.png" alt="" title=""> &nbsp;  
                                {{ $t('contactInfo') }} &nbsp;
                                <img src="/ecommerce/img/f_title_icon_mirror.png" alt="" title="">
                            </h2>
                            <ul class="contact-info">
                                <li> <i class="fas fa-location-arrow icon-footer"></i><a href="#">205 Lorem ipsum,<br/>Herba Street Front USA</a></li>
                               <li>  <i class="far fa-envelope icon-footer"></i><a href="#">foodinfo@gmail.com</a></li>
                               <li>  <i class="fas fa-phone icon-footer"></i><a href="#">120-452-12356</a></li>
                            </ul>                        
                        </div>
                    </div>
                    
                    <!-- <div class="footer_colum">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title"><img src="/ecommerce/img/f_title_icon.png" alt="" title=""> &nbsp;  
                               Newsletter &nbsp;
                                <img src="/ecommerce/img/f_title_icon_mirror.png" alt="" title=""></h2>
                            <p>Enter your email and we’ll send you latest information plans.</p>
                            <div class="newsletter-form">
                                <form action="#">
                                    <input type="email" placeholder="Enter Your Email">
                                    <input type="submit" value="Send">
                                </form>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
        </div> <!-- End footer top area -->
        
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="copyright">
                        <p>{{ $t('copyRight') }} &copy; {{ $t('allRightReserved') }}</p>
                    </div>
                     <div class="site_by">
                        <p>{{ $t('designAndDeveloperdBy') }}: <a href="http://www.d9ithub.com" target="_blank">D9ithub Software Solutions</a></p>
                    </div>
                </div>
            </div>
        </div> <!-- End footer bottom area -->


        <!-- model for seller registration -->
            <div id="example-modal">
                <!-- Modal -->
                <div class="modal fade" id="sellerRegisterrModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div id="msform">
                                {{validationErrors.length}}
                            <div v-if="validationErrors.length > 0">
                                <ul class="alert alert-danger">
                                    <li v-for="(value, key, index) in validationErrors" :key="index">@{{ value }}</li>
                                </ul>
                            </div>
                            <fieldset class="login_form">
                                <h2><img src="/ecommerce/img/logo.png" alt=" " title=""></h2>
                                <h2 class="fs-title">{{ $t('sellerRegitration') }}</h2>

                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('firstName') }}</label>
                                    <input type="text" name="firstname" :placeholder="$t('firstName')" data-vv-name="firstname" data-vv-as="First Name" v-validate="'required'"  :class="{'alert-danger': errors.has('firstname')}" v-model="firstName" />
                                </div>

                                <!-- <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('firstNameArabic') }}</label>
                                    <input type="text" name="firstname" :placeholder="$t('firstNameArabic')" data-vv-name="firstNameArabic" data-vv-as="First Name Arabic" v-validate="'required'"  :class="{'alert-danger': errors.has('firstNameArabic')}" v-model="firstName" />
                                </div> -->

                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('lastName') }}</label>
                                    <input type="text" name="lastname" :placeholder="$t('lastName')" data-vv-name="lastname" data-vv-as="Last Name" v-validate="'required'"  :class="{'alert-danger': errors.has('lastname')}" v-model="lastName" />
                                </div>

                                <!-- <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('lastNameArabic') }}</label>
                                    <input type="text" name="lastNameArabic" :placeholder="$t('lastNameArabic')" data-vv-name="lastNameArabic" data-vv-as="Last Name Arabic" v-validate="'required'"  :class="{'alert-danger': errors.has('lastNameArabic')}" v-model="lastNameArabic" />
                                </div> -->

                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('email') }}</label>
                                    <input type="email" name="email" :placeholder="$t('email')" data-vv-name="email" data-vv-as="Email" v-validate="'required'"  :class="{'alert-danger': errors.has('email')}" v-model="email" />
                                </div>

                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('mobile') }}</label>
                                    <input type="text" name="mobile" :placeholder="$t('mobile')" data-vv-name="mobile" data-vv-as="Last Name Arabic" v-validate="'required'"  :class="{'alert-danger': errors.has('mobile')}" v-model="mobileNumber" />
                                </div>

                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('password') }}</label>
                                    <input type="password" name="passwords" :placeholder="$t('password')" data-vv-name="password" v-validate="'required'"  :class="{'alert-danger': errors.has('password')}" ref="password" v-model="password" />
                                </div>

                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('confirmPassowrd') }}</label>
                                    <input type="password" name="password" :placeholder="$t('confirmPassowrd')"  data-vv-name="confirmPassowrd" v-validate="'required|confirmed:password'"  :class="{'alert-danger': errors.has('confirmPassowrd')}" v-model="confirmPassword" />
                                </div>
                                <div class="form-group">
                                    <label for="phone_id" class="control-label">{{ $t('countryCode') }}</label> 
                                    <select name="country" v-model="countryCode">
                                        <option v-for="(count, index) in country" :key="index" :value="count.dial_code" :selected="count.dial_code == 971">  {{ count.dial_code }} - {{ count.name }}</option>
                                    </select>
                                </div>

                                <div class="shipping_btn">
                                    <button type="button" name="next" @click="sellerRegister">{{ $t('register') }}</button>                                        
                                </div>
                                
                                
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        <!-- end model -->
    </div>
</template>

<script>
import { mapState, mapGetters, mapMutations, mapActions  } from 'vuex'
export default {
    computed: {
        ...mapState([
            'getLocale',
            'isLogin',
            'errorMessage',
            'successMessage',
            'country',
            'loader',

        ]),
    },
    data () {
        return {
            firstName: '',
            lastName: '',
            firstNameArabic: '',
            lastNameArabic: '',
            email: '',
            password: '',
            confirmPassword: '',
            countryCode: 971,
            mobileNumber: '',
            forgotEmail: '',
            forgetPass: false,
            validationErrors: [],
        }
    },
    methods: {
         ...mapActions([
            'ACTION_PUSH_SUCCESS',
            'ACTION_PUSH_ERROR',
        ]),
        openPopup () {
            $('#sellerRegisterrModal').modal('show')
        },
        sellerRegister () {
            this.$validator.validateAll().then(result => {
                if(result) {
                    axios.post('/api/users', {
                        first_name: this.firstName,
                        last_name: this.lastName,
                        first_name_arabic: this.firstNameArabic,
                        last_name_arabic: this.lastNameArabic,
                        email: this.email,
                        password: this.password,
                        confirm_password: this.confirmPassword,
                        country_code: this.countryCode,
                        mobile_number: this.mobileNumber,
                        roleId: 2,
                    })
                    .then (response => {
                        this.ACTION_PUSH_SUCCESS(this.$t('sellerRegitrationSuccessFully'))
                        $('#sellerRegisterrModal').modal('hide')
                        this.firstName = ''
                        this.lastName = ''
                        this.firstNameArabic = ''
                        this.lastNameArabic = ''
                        this.email = ''
                        this.password = ''
                        this.confirmPassword = ''
                        this.countryCode = ''
                        this.mobileNumber = ''
                    })
                    .catch (errorResponse => {
                        console.log(errorResponse)
                        this.ACTION_PUSH_ERROR(this.$t(errorResponse.response.data.message))
                    })
                }
            })
        }
    }
}
</script>

<style>

</style>
