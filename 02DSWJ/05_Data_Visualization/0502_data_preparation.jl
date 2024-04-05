using CSV, XLSX, DataFrames
cd("02DSWJ/Data/05DataVisualization")

xfile = XLSX.readxlsx("P_Popular Indicators.xlsx")
sheet = xfile["Data"]
data = XLSX.gettable(sheet) |> DataFrame 

for col in eachcol(data)
    replace!(col, ".." => missing)
end

colnames = vcat(["sname", "scode", "cname", "ccode"], string.(1960:2022));
rename!(data, colnames)

data = stack(data, 5:67, variable_name = :year)
select!(data, Not(:sname))

data = unstack(data, :scode, :value)

colnames = ["cname", "ccode", "year", "population", "pop_growth", "area", 
            "poverty", "gni_usd", "gni_pcapita", "gni_ppp", "gni_ppp_pcapita",
            "income_share_low20", "life_exp", "fertility", "adolescent_fertility",
            "contraceptive_prevalence", "births_by_health_staff", "mortality",
            "underweight_prevalence", "immunization", "primary_completion",
            "secondary_enrollment", "primary_secondary_enrollment", 
            "hiv_prevalence", "forest_area", "water_productivity", 
            "energy_use", "co2emission", "electric_cons", "gdp_usd", 
            "gdp_growth", "inflation", "agri_val_added", "ind_val_added", 
            "exp_per_gdp", "imp_per_gdp", "gross_capital", "revenue", 
            "startup_procs", "market_cap", "military_exp", "mobile_subs", 
            "hitech_exps", "merchandise_trade", "net_barter", "external_debt", 
            "debt_service", "net_migration", "personal_remittances", 
            "fdi_inflow", "net_oda_percapita", "gdp_percapita", "fdi_net", "cpi"];

rename!(data, colnames)
CSV.write("worldbankdata.csv", data)