class NounsController < ApplicationController

  # GET /nouns/play
  #start -> muestra el primero
  #validar -> valida resultado, pulsar en "NEXT"
  #Next -> busca otro que no haya salido y muestra el layout de "start"
  #finish -> mostramos estadisticas de resultados y reseteamos

  def play
    session[:play_list] = []
    session[:hits] = 0

    @hits = session[:hits]

    play_list = session[:play_list]   #quitar la @ para que no sea accesible

    @noun = Noun.find(:random)

    session[:play_list] = play_list.push(@noun.id)

    respond_to do |format|
      format.html # play.html.erb
    end
  end

  def next
    #validamos resultado
    @article_f = params[:commit]
    @article = params[:article]

    @hit = 0
    if @article_f.downcase == @article.downcase
      session[:hits] = session[:hits] + 1
      @hit = 1
    end
    @hits = session[:hits]

    #buscamos nueva palabra a mostrar
    play_list = session[:play_list]
    play_list = [] if play_list.nil?

    @nouns_played = play_list.length

    @noun = Noun.find(:random, @play_list)
    session[:play_list] = play_list.push(@noun.id)

    render 'play'
  end

  def finish
    #mostrar resumen
    @hits = session[:hits]
    play_list = session[:play_list]
    @nouns_played = play_list.length - 1 #porque la última carta mostrada no se juega

    reset_session

    respond_to do |format|
      format.html # play.html.erb
    end
  end

  # GET /nouns
  # GET /nouns.xml
  def index
    @nouns = Noun.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nouns }
    end
  end

  # GET /nouns/1
  # GET /nouns/1.xml
  def show
    @noun = Noun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @noun }
    end
  end

  # GET /nouns/new
  # GET /nouns/new.xml
  def new
    @noun = Noun.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @noun }
    end
  end

  # GET /nouns/1/edit
  def edit
    @noun = Noun.find(params[:id])
  end

  # POST /nouns
  # POST /nouns.xml
  def create
    @noun = Noun.new(params[:noun])

    respond_to do |format|
      if @noun.save
        format.html { redirect_to(@noun, :notice => 'Noun was successfully created.') }
        format.xml  { render :xml => @noun, :status => :created, :location => @noun }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @noun.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nouns/1
  # PUT /nouns/1.xml
  def update
    @noun = Noun.find(params[:id])

    respond_to do |format|
      if @noun.update_attributes(params[:noun])
        format.html { redirect_to(@noun, :notice => 'Noun was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @noun.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nouns/1
  # DELETE /nouns/1.xml
  def destroy
    @noun = Noun.find(params[:id])
    @noun.destroy

    respond_to do |format|
      format.html { redirect_to(nouns_url) }
      format.xml  { head :ok }
    end
  end
end
