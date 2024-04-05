using CairoMakie

fig = Figure(backgroundcolor = RGBf(0.75, 0.75, 1))
ax = Axis(fig[1,1])
fig

x = 0:0.5:10;
y = @. 2x + 3 + rand() * 4;

scatter!(ax, x, y, color=:blue)
fig

scatter(x, y)

fig = Figure(backgroundcolor = RGBf(0.65, 0.75, 0.95))
ax1 = Axis(fig[1,1])
ax2 = Axis(fig[1,2])

scatter!(ax1, x, y)
lines!(ax2, x, y)
fig