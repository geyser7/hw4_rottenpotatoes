# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    @movie = Movie.create!(movie)
  end
  #flunk "Unimplemented"
  moviescount = movies_table.rows
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #flunk "Unimplemented"
  step "I am on the RottenPotatoes home page"
  regexp = /#{e1}.*#{e2}/m #  /m means match across newlines
  page.body =~ regexp
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(',').each do |rating|
	  if(uncheck)
	    uncheck("ratings_" << rating.strip);
	  else
	    check("ratings_" << rating.strip);
	  end
  end
end

Then /I should see all of the movies/ do 
  #flunk "Unimplemented"
  page.all('table#movies tr').count == Movie.count
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  @movie = Movie.find_by_title(title)
  @movie.director == director
end


