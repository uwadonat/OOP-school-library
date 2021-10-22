class Corrector
  def correct_name(name)
    name.capitalize!
    name[0,10]
  end
end

donat = Corrector.new()
puts donat.correct_name("uwamahorohahahahahsh")