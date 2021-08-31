# This migration comes from solidus_flexi_variants (originally 20210831175406)
class AddIdxsOnAdHocOptValLineItemsToForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_index(:spree_ad_hoc_option_values_line_items,
              :line_item_id,
              name: :idx_spree_ad_hoc_opt_vals_to_line_item_id)

    add_index(:spree_ad_hoc_option_values_line_items,
              :ad_hoc_option_value_id,
              name: :idx_spree_ad_hoc_opt_vals_to_ad_hoc_opt_val_id)

  end
end
