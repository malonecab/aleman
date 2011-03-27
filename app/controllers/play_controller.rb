class PlayController < ApplicationController

 def start
    #session[:hits_translation] = 0
    #@translations = []
    #@hits_translation = session[:hits_translation]

    @hits_article = Get_hits_article()
    play_list = Get_play_list()
    @nouns_played = play_list.length - 1

    unless @nouns_played == Noun.count
      @noun = Noun.find(:random, play_list)              #obtenemos la palabra a mostrar, pasando la lista
      #@translations = get_random_translations(@noun)
      Push_play_list(@noun.id)
      respond_to do |format|
        format.html # start.html.erb
      end
    else
      redirect_to :action => 'finish'
    end
  end


    def validation
      #validamos resultado
      article_f = params[:commit]     #articulo seleccionado
      article = params[:article]

      #translation_f = params[:translation_f]        #traducción seleccionada
      #translate = params[:translate]

      @hit_article = 0
      #@hit_translation = 0

      @word_hit = article.to_s + " " + params[:word].to_s

      if article_f.downcase == article.downcase
        Push_hits_article()
        @hit_article = 1
      end
    end

   def finish
     #mostrar resumen
     @hits_article = Get_hits_article()
     #@hits_translation = session[:hits_translation]
     @nouns_played = Get_play_list().length - 1

     reset_session

     respond_to do |format|
       format.html # finish.html.erb
     end
   end

  def Get_play_list
   session[:play_list].nil? ? [0] : session[:play_list]
  end

 def Push_play_list(id)
    session[:play_list] = [0] if session[:play_list].nil?
    session[:play_list] = session[:play_list].push(id)
 end

 def Get_hits_article
   session[:hits_article].nil? ? 0 : session[:hits_article]
 end

 def Push_hits_article
    session[:hits_article] = 0 if session[:hits_article].nil?
    session[:hits_article] = session[:hits_article]+1
 end


  def get_random_translations (first_noun)
    translations = []
    translation_list = []

      translations.push(first_noun.translation)    #guardamos su traducción y buscamos otras 2 mas
      translation_list.push(first_noun.id)

      if Noun.count > 1
          noun_aux = Noun.find(:random, translation_list)   #segunda traducción
          translations.push(noun_aux.translation)
          translation_list.push(noun_aux.id)
      else
          translations.push("X")
      end

      if Noun.count > 2
          noun_aux = Noun.find(:random, translation_list)   #tercera traducción
          translations.push(noun_aux.translation)
      else
           translations.push("Y")
       end

      return translations.shuffle!                         #revolvemos!
  end
end

      #if translation_f == translate
        #session[:hits_translation] = session[:hits_translation] + 1
        #@hit_translation = 1
      #end
      #@hits_translation = session[:hits_translation]

      #play_list = session[:play_list]
      #play_list = [] if play_list.nil?
      #@nouns_played = play_list.length

      #unless play_list.length == Noun.count
      #  @noun = Noun.find(:random, play_list)
      #  #@translations = []
      #  #@translations = get_random_translations(@noun)
      #  session[:play_list] = play_list.push(@noun.id)
      #  @data = session[:play_list]
      #  render 'start'
      #else
        #flash[:notice] = "No quedan palabras para jugar"
      #  redirect_to :action => 'finish'
      #end
    #end
