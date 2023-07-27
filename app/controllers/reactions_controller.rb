class ReactionsController < ApplicationController
    before_action :authenticate_user!
    def user_reaction
        @user = current_user
        @article = Article.find(params[:article_id])
        reaction = Reaction.find_by(user_id: @user.id, article_id: @article.id)
            if reaction
                return flash.now[:alert] = 'You already reacted to this post'
            else
                @new_reaction = Reaction.new(user_id: @user.id, article_id: @article.id, kind: params[:kind])
                    respond_to do |format|
                        if @new_reaction.save!
                            format.html { redirect_to article_path(@article), notice: "#{current_user.email} has stated that it #{@new_reaction.kind} the product" }
                        else
                            format.html { redirect_to article_path(@article), status: :unprocessable_entity }
                        end
                    end
            end
        end
        def article_with_reactions
            @articles=Article.all
            @reactions = current_user.reactions
            article_ids = @reactions.map(&:article_id)
            article= Article.where(id:article_ids)
        end

    end
