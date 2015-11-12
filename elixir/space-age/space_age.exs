defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_seconds = 31557600

    case planet do
      :earth 
        -> seconds/earth_seconds
      :mercury 
        -> seconds/(earth_seconds * 0.2408467)
      :venus 
        -> seconds/(earth_seconds * 0.61519726)
      :mars 
        -> seconds/(earth_seconds * 1.8808158)
      :jupiter 
        -> seconds/(earth_seconds * 11.862615)
      :saturn 
        -> seconds/(earth_seconds * 29.447498)
      :uranus 
        -> seconds/(earth_seconds * 84.016846)
      :neptune 
        -> seconds/(earth_seconds * 164.79132)
      _ 
        -> true
    end
  end
end
