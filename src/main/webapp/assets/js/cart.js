


(function($) {
    "use strict"

    // Mobile Nav toggle
    $('.menu-toggle > a').on('click', function (e) {
        e.preventDefault();
        $('#responsive-nav').toggleClass('active');
    })

    // Fix cart dropdown from closing
    $('.cart-dropdown').on('click', function (e) {
        e.stopPropagation();
    });

    /////////////////////////////////////////

    $('.input-number').each(function() {
        var $this = $(this),

            $input = $this.find('#valueNumber'),
            $InputIdCart = $this.find('#valueIdCart'),
            up = $this.find('.qty-up'),
            down = $this.find('.qty-down');


        var value
        var idCart = parseInt($InputIdCart.val());
        down.on('click', function () {
            // thai đổi số lượng
            value = parseInt($input.val()) - 1;
            value = value < 1 ? 1 : value;
            $input.val(value);
            $input.change();
            updatePriceSlider($this , value)

            //
            var tatol = $('#tatol_'+ idCart);
            // lây gia của sản phâm
            var  Inprice =   $('#price_'+ idCart);
            var  price =  parseFloat(Inprice.val());



            $.ajax({
                url: '/UpdateCart',
                type: 'get',
                cache: false,
                data: { idCart:idCart , quatity : value,price:price} ,

                success: function (data) {
                    tatol.html(data);
                },
                error: function () {
                    alert("error");
                }
            });
        })

        up.on('click', function () {

            // thai đổi số lượng
            value = parseInt($input.val()) + 1;
            $input.val(value);
            $input.change();
            updatePriceSlider($this , value)
            //
            var tatol = $('#tatol_'+ idCart);
            // lây gia của sản phâm
            var  Inprice =   $('#price_'+ idCart);
            var  price =  parseFloat(Inprice.val());


            $.ajax({
                url: '/UpdateCart',
                type: 'get',
                cache: false,
                data: { idCart:idCart , quatity : value,price:price} ,

                success: function (data) {
                    tatol.html(data);
                },
                error: function () {
                    alert("error");
                }
            });
        })


    });
    // Check
      const checkAllCart = $("#checkAllCart");
    const BtnBuy = $("#btn-buy");
      const listCheckCart = $('input[name="cartIds[]"]');

      checkAllCart.change(function (){
          var ischeckAll = $(this).prop("checked");

         listCheckCart.prop("checked",ischeckAll);
          renderCheckAllSumit();
      })

      listCheckCart.change(function () {
          var ischeckAll = listCheckCart.length === $('input[name="cartIds[]"]:checked').length;
          checkAllCart.prop("checked",ischeckAll);
          renderCheckAllSumit();
      })
      function renderCheckAllSumit(){
          var nemberCheck = $('input[name="cartIds[]"]:checked').length;
          if(nemberCheck > 0){
              BtnBuy.removeClass('disabled');
          }else {
              BtnBuy.addClass('disabled');
          }
      }


    //   checkAllCart.on('change',)
    // //
    // Products Slick
    $('.products-slick').each(function() {
        var $this = $(this),
            $nav = $this.attr('data-nav');

        $this.slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            autoplay: true,
            infinite: true,
            speed: 300,
            dots: false,
            arrows: true,
            appendArrows: $nav ? $nav : false,
            responsive: [{
                breakpoint: 991,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                }
            },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                    }
                },
            ]
        });
    });

    // Products Widget Slick
    $('.products-widget-slick').each(function() {
        var $this = $(this),
            $nav = $this.attr('data-nav');

        $this.slick({
            infinite: true,
            autoplay: true,
            speed: 300,
            dots: false,
            arrows: true,
            appendArrows: $nav ? $nav : false,
        });
    });

    /////////////////////////////////////////

    // Product Main img Slick
    $('#product-main-img').slick({
        infinite: true,
        speed: 300,
        dots: false,
        arrows: true,
        fade: true,
        asNavFor: '#product-imgs',
    });

    // Product imgs Slick
    $('#product-imgs').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        centerMode: true,
        focusOnSelect: true,
        centerPadding: 0,
        vertical: true,
        asNavFor: '#product-main-img',
        responsive: [{
            breakpoint: 991,
            settings: {
                vertical: false,
                arrows: false,
                dots: true,
            }
        },
        ]
    });

    // Product img zoom
    var zoomMainProduct = document.getElementById('product-main-img');
    if (zoomMainProduct) {
        $('#product-main-img .product-preview').zoom();
    }

    /////////////////////////////////////////



    var priceInputMax = document.getElementById('price-max'),
        priceInputMin = document.getElementById('price-min');

    priceInputMax.addEventListener('change', function(){
        updatePriceSlider($(this).parent() , this.value)
    });

    priceInputMin.addEventListener('change', function(){
        updatePriceSlider($(this).parent() , this.value)
    });

    function updatePriceSlider(elem , value) {
        if ( elem.hasClass('price-min') ) {
            console.log('min')
            priceSlider.noUiSlider.set([value, null]);
        } else if ( elem.hasClass('price-max')) {
            console.log('max')
            priceSlider.noUiSlider.set([null, value]);
        }
    }

    // Price Slider
    var priceSlider = document.getElementById('price-slider');
    if (priceSlider) {
        noUiSlider.create(priceSlider, {
            start: [1, 999],
            connect: true,
            step: 1,
            range: {
                'min': 1,
                'max': 999
            }
        });

        priceSlider.noUiSlider.on('update', function( values, handle ) {
            var value = values[handle];
            handle ? priceInputMax.value = value : priceInputMin.value = value
        });
    }

})(jQuery);
