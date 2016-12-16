defmodule ProductCatalog.Service.Product do
  products = [
    %{
      title: "Sennheiser HD 202 II Professional Headphones",
      description: "The HD 202 MK II closed, dynamic hi-fi stereo headphones are the ideal partner for DJs and powerful modern music, providing great insulation against ambient noise and a vivid, crisp bass response. The rugged lightweight headphones have a secure fit and can be used for both mobile sources and home (mini) hi-fi systems. When out and about, a convenient cord take-up lets you adjust the headphone cable to the required length.",
      image: "http://ecx.images-amazon.com/images/I/71OJzVOZ5HL._SL1500_.jpg",
      price: 23.64
    },
    %{
      title: "Bose QuietComfort 25 Acoustic Noise Cancelling Headphones",
      description: "QuietComfort 25 headphones are engineered to sound better, be more comfortable and easier to take with you. Put them on, and suddenly everything changes. Your music is deep, powerful and balanced, and so quiet that every note sounds clearer. Even air travel becomes enjoyable, as engine roar gently fades away. No matter how noisy the world is, it’s just you and your music—or simply peace and quiet.",
      image: "http://ecx.images-amazon.com/images/I/71%2BHRQB7YCL._SL1500_.jpg",
      price: 299.00
    },
    %{
      title: "Audio-Technica ATH-M50x Professional Studio Monitor Headphones",
      description: "As the most critically acclaimed model in the M-Series line, the ATH-M50 is praised by top audio engineers and pro audio reviewers year after year. Now, the ATH-M50x professional monitor headphones feature the same coveted sonic signature, with the added feature of detachable cables. From the large aperture drivers, sound isolating earcups and robust construction, the M50x provides an unmatched experience for the most critical audio professionals.",
      image: "http://ecx.images-amazon.com/images/I/815OQlSZfkL._SL1500_.jpg",
      price: 128.00
    }
  ] |> Enum.map(fn(product) ->
    id = "p#{:crypto.hash(:md5, product.title) |> Base.encode16(case: :lower)}"
    Map.put(product, :id, id)
  end)

  def all do
    unquote(Enum.map(products, fn(%{id: id}) ->
      id
    end))
  end

  for product <- products do
    def get(unquote(product.id)) do
      unquote(Macro.escape(product))
    end
  end
  def get(_) do
    throw :not_found
  end
end
