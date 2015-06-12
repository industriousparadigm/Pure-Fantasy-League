class LeagueController < ApplicationController
  before_action :authenticate_user!
  before_action :set_league!, :set_team!, except: :set
  respond_to :html


  def set
    set_league League.find(params[:id])
    redirect_to :root
  end


  private

    def set_league!
      @leagues = current_user.leagues.current_season

      return if current_league

      if @leagues.count === 1
        set_league @leagues.first
      else
        unset_league
        redirect_to :root unless current_page?(:root)
      end
    end

    def set_league(league)
      session[:current_league] = league.try(:id) || league
    end

    def unset_league
      session.delete :current_league
      @current_league = nil
    end

    def current_league
      @current_league ||= session[:current_league] && League.find(session[:current_league])
    end

    def set_team!
      return unless current_league

      manager = current_league.managers.find_by(user: current_user)
      if team = current_league.teams.find_by(manager: manager)
        set_team team
      else
        unset_team
        redirect_to :root unless current_page?(:root)
      end
    end

    def set_team(team)
      session[:current_team] = team.try(:id) || team
    end

    def unset_team
      session.delete :current_team
      @current_team = nil
    end

    def current_team
      @current_team ||= session[:current_team] && Team.find(session[:current_team])
    end

    def current_page?(options)
      unless request
        raise "You cannot use helpers that need to determine the current "
              "page unless your view context provides a Request object "
              "in a #request method"
      end

      return false unless request.get? || request.head?

      url_string = URI.parser.unescape(url_for(options)).force_encoding(Encoding::BINARY)

      # We ignore any extra parameters in the request_uri if the
      # submitted url doesn't have any either. This lets the function
      # work with things like ?order=asc
      request_uri = url_string.index("?") ? request.fullpath : request.path
      request_uri = URI.parser.unescape(request_uri).force_encoding(Encoding::BINARY)

      if url_string =~ /^\w+:\/\//
        url_string == "#{request.protocol}#{request.host_with_port}#{request_uri}"
      else
        url_string == request_uri
      end
    end

end
