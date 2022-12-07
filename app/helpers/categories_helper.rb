module CategoriesHelper
  ICONS = {
    "shopping" => "fa-solid fa-cart-shopping",
    "walking" => "fa-solid fa-person-walking",
    "medical" => "fa-solid fa-notes-medical",
    "reading" => "fa-solid fa-book-open",
    "playing" => "fa-solid fa-puzzle-piece",
    "discussing" => "fa-regular fa-comment"
  }

  def find_icon(category)
    ICONS[category]
  end
end
