class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
		
		@css1 = ""
		@css2 = ""
		if params[:id] != nil
			
			if params[:id] == "1"
				@css1 = "hilite"
				@movies = Movie.find(:all, :order => "title")
			end
			if params[:id] == "2"
					@css2 = "hilite"
					@movies = Movie.find(:all, :order => "release_date")
			end
		else
		
			@movies = Movie.all
		end
			   
		
  end

  def new
    # default: render 'new' template
  end

	def sort_title
		sort_type = params[:foo]
		
			@movies = Movie.find(:all, :order => "title")
		
	end

  def test
		foo = params[:foo]
		@test = Movie.inspect
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
