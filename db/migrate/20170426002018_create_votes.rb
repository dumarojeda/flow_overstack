class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.integer :question_id
      t.integer :answer_id
      t.timestamps
    end
  end
end

#We don't need :count because every istance is a vote. Count would be used under a different name for weight and direction
#t.integer :count
#question.votes
#question.votes.reduce()
