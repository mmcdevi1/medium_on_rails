class RemoveRecommendedFromRecommend < ActiveRecord::Migration
  def change
    remove_column :recommends, :recommended
  end
end
