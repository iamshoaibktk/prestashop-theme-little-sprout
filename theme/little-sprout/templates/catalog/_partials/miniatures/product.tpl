{**
 * Little Sprout product card: photo, name, then the price with the age range on one row,
 * then the fabric label and the colour dots. The cart button block is Hummingbird's own;
 * the Theme Kit card style shows it as a round "+" over the photo.
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{extends file='parent:catalog/_partials/miniatures/product.tpl'}

{* Colours are shown as dots on the last row (see product_reviews). *}
{block name='product_variants'}{/block}

{* Old price before the current one; the age range (first Theme Kit card label) at the end of the row. *}
{block name='product_discount_price'}
  {if $product.has_discount}
    <span class="product-miniature__regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
  {/if}
  {capture name='ls_tags'}{hook h='displayProductListReviews' product=$product}{/capture}
  {if $smarty.capture.ls_tags|trim}<span class="ls-card__ages">{$smarty.capture.ls_tags nofilter}</span>{/if}
{/block}

{* The fabric (second card label) and the colours. *}
{block name='product_reviews'}
  {if $smarty.capture.ls_tags|default:''|trim || $product.main_variants}
    <div class="ls-card__meta">
      {if $smarty.capture.ls_tags|default:''|trim}<span class="ls-card__fabric">{$smarty.capture.ls_tags nofilter}</span>{/if}
      {if $product.main_variants}<span class="product-miniature__variants">{include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}</span>{/if}
    </div>
  {/if}
{/block}
