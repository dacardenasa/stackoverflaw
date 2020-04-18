module PreguntaHelper
  def form_title 
    @pregunta.new_record? ? "Nueva Pregunta" : "Editar Pregunta"
  end
end
