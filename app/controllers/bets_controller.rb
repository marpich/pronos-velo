class BetsController < ApplicationController
  def index
    @all_bets = Bet.joins(:stage).where(user: current_user).order(number: :asc, position: :asc).group_by(&:stage).group_by { |stage, _bets| stage.race }
    @user_total_scores = TotalScore.where(user: current_user)
    @my_leagues = League.where_am_i(current_user)
  end

  def create
    @stage = Stage.find(params[:stage_id])

    if @stage.stage_type == "Chrono equipe"
      # first bet
      team = bet_params["rider_1"]
      first_bet = create_bet_team(1, team)

      # second bet
      team = bet_params["rider_2"]
      second_bet = create_bet_team(2, team)

      # third bet
      team = bet_params["rider_3"]
      third_bet = create_bet_team(3, team)
    else
      # first bet
      bib = bet_params["rider_1"].split.first.to_i
      first_bet = create_bet(1, bib)

      # second bet
      bib = bet_params["rider_2"].split.first.to_i
      second_bet = create_bet(2, bib)

      # third bet
      bib = bet_params["rider_3"].split.first.to_i
      third_bet = create_bet(3, bib)
    end

    if first_bet && second_bet && third_bet
      redirect_to stage_path(@stage, prono: true)
    else
      Bet.where(user: current_user, stage: @stage).destroy_all
      flash[:alert] = "Vous ne pouvez choisir un coureur qu'une seule fois !"
      render "stages/show"
    end
  end

  private

  def bet_params
    params.permit(:rider_1, :rider_2, :rider_3)
  end

  def create_bet(position, bib)
    bet = Bet.new
    bet.position = position
    bet.user = current_user
    bet.stage = @stage
    bet.rider = Rider.where(bib: bib, race: @stage.race).first
    bet.save!
  end

  def create_bet_team(position, team)
    bet = Bet.new
    bet.position = position
    bet.user = current_user
    bet.stage = @stage
    bet.rider = Rider.where(team: team, race: @stage.race).first
    bet.save!
  end
end
