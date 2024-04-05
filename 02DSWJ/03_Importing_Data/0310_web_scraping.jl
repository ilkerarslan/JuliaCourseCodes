using HTTP, EzXML, CSV, DataFrames

url = "https://www.imdb.com/chart/boxoffice/?ref_=nv_ch_cht"
response = HTTP.get(url)
response.status
htmltext = String(response.body)
tree = parsehtml(htmltext);
rootnode = root(tree)

query = Dict(
    "title" => """//li//h3[@class="ipc-title__text"]""",
    "weekly_gross" => """//li//ul/li[1]/span[2]""",
    "total_gross" => """//li//ul/li[2]/span[2]""",
    "weeks_released" => """//li//ul/li[3]/span[2]""",
    "rating" => """//span/div/span/text()"""
)

title = findall(query["title"], rootnode) .|> nodecontent

week_gross = findall(query["weekly_gross"], rootnode) .|> nodecontent
week_gross = replace.(week_gross, r"[\$M]" => "") |> x -> parse.(Float64, x)

total_gross = findall(query["total_gross"], rootnode) .|> nodecontent
total_gross = replace.(total_gross, r"[\$M]" => "") |> x -> parse.(Float64, x)

weeks = findall(query["weeks_released"], rootnode) .|> nodecontent
weeks = parse.(Int, weeks)

rating = findall(query["rating"], rootnode) .|> nodecontent
rating = parse.(Float64, rating)

imdb_box_office = DataFrame(title = title,
                            week_gross = week_gross,
                            total_gross = total_gross,
                            weeks = weeks,
                            rating = rating)