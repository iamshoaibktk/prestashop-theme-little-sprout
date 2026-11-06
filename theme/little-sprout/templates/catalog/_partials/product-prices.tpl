{**
 * Little Sprout: the fabric label beside the price (Theme Kit card labels; the age range is hidden here
 * because the sizes below show it).
 * @author iamshoaibktk@gmail.com  @license AFL-3.0
 *}
{extends file='parent:catalog/_partials/product-prices.tpl'}
{block name='product_price'}
  {$smarty.block.parent}
  {capture name='ls_ptags'}{hook h='displayProductListReviews' product=$product}{/capture}
  {if $smarty.capture.ls_ptags|trim}<div class="ls-pfabric">{$smarty.capture.ls_ptags nofilter}</div>{/if}
{/block}
