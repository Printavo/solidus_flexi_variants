# This migration comes from solidus_flexi_variants (originally 20210831174210)
class AddIdxsOnCustdProdOptsToForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_index(:spree_customized_product_options,
              :product_customization_id,
              name: :idx_spree_customized_prod_ops_to_prod_cust_id)

    add_index(:spree_customized_product_options,
              :customizable_product_option_id,
              name: :idx_spree_customized_prod_ops_to_custd_prod_opt_id)
  end
end
