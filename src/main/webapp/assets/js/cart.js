


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
            renderToTalPrice();


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
            renderToTalPrice();

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
          $.ajax({
              url: '/IsCheckAllCart',
              type: 'get',
              cache: false,
              data: {  isCheck : ischeckAll} ,

              success: function (data) {

              },
              error: function () {
                  alert("error");
              }
          });
         listCheckCart.prop("checked",ischeckAll);

          renderCheckAllSumit();
          renderToTalPrice();


      })

      listCheckCart.change(function () {
          var ischeckAll = listCheckCart.length === $('input[name="cartIds[]"]:checked').length;
          checkAllCart.prop("checked",ischeckAll);
          renderCheckAllSumit();
          renderToTalPrice();
      })
      function renderCheckAllSumit(){
          var nemberCheck = $('input[name="cartIds[]"]:checked').length;

          if(nemberCheck > 0){
              BtnBuy.removeClass('disabled');
          }else {
              BtnBuy.addClass('disabled');
          }

      }
    function formatVND(value) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency',
            currency: 'VND' }).format(value);
    }
     function renderToTalPrice(){
         var listInputChecked = $('input[name="cartIds[]"]:checked');
         var buyTotal = document.querySelector('#buy-total');
         var total = 0.0;
         for (let i = 0; i <listInputChecked.length ; i++) {
             const  node = listInputChecked[i];
             const  parent = node.parentNode.parentNode.parentNode
             const InputIdCart =  parent.querySelector('#valueIdCart');

             const  inputNumber = parent.querySelector('#valueNumber');
             const  inputPrice =  parent.querySelector('#price_'+parseInt(InputIdCart.value));
             const  quantity = parseInt(inputNumber.value);
             const  price = parseFloat(inputPrice.value);
             total += quantity*price;

         }
         buyTotal.innerHTML = formatVND(total);

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

function handleCheck(element, type = 0) {
    const isCheck = element.checked;
    if(type == 0){
        const idCart = parseInt(element.value);
        $.ajax({
            url: '/IsCheckCart',
            type: 'get',
            cache: false,
            data: { idCart:idCart , isCheck : isCheck} ,

            success: function (data) {

            },
            error: function () {
                alert("error");
            }
        });
    }
}