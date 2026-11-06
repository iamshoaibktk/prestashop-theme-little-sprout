{**
 * Little Sprout: under the description, "Fabric and care" (the product's features) and
 * "Delivery and returns". Keeps .js-product-details, which the theme refreshes on combination change.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
<div class="js-product-details" data-product="{$product.embedded_attributes|json_encode}">
  {if $product.grouped_features}
    <div class="accordion-item" id="product_features">
      <h2 class="accordion-header" id="product_features_heading">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#product_features_collapse" aria-expanded="false" aria-controls="product_features_collapse">
          {l s='Fabric and care' d='Modules.Hbkit.Shop'}
        </button>
      </h2>
      <div id="product_features_collapse" class="accordion-collapse collapse" aria-labelledby="product_features_heading">
        <div class="accordion-body">
          <dl class="ls-facts">
            {foreach from=$product.grouped_features item=feature}
              <div class="ls-facts__row"><dt>{$feature.name}</dt><dd>{$feature.value|escape:'htmlall'|nl2br nofilter}</dd></div>
            {/foreach}
          </dl>
        </div>
      </div>
    </div>
  {/if}
  {if !empty($modules.hbkit.texts.delivery)}
    <div class="accordion-item" id="product_delivery">
      <h2 class="accordion-header" id="product_delivery_heading">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#product_delivery_collapse" aria-expanded="false" aria-controls="product_delivery_collapse">
          {l s='Delivery and returns' d='Modules.Hbkit.Shop'}
        </button>
      </h2>
      <div id="product_delivery_collapse" class="accordion-collapse collapse" aria-labelledby="product_delivery_heading">
        <div class="accordion-body">{$modules.hbkit.texts.delivery}</div>
      </div>
    </div>
  {/if}
</div>
