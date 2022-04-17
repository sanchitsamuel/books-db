class Book < ApplicationRecord
  validates :publisher, presence: true
  validates :title, presence: true
  validates :author_last_name, presence: true
  validates :author_first_name, presence: true
  validates :price, presence: true

  def cite_mla(year, page)
    "#{author_last_name}, #{author_first_name}. '#{title}' #{title_collection}, edited by #{editor_name}, #{publisher} #{year}, p. #{page}."
  end

  def chicago_style_citation(page_range)
    "#{title}, no. #{volumn} (#{issue.strftime('%B %Y')}): #{page_range}. https://doi.org/10.xxxx/xxxxx."
  end
end
