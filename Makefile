start: .env
	@$(shell cat .env | grep '^#' --invert-match | xargs) iex -S mix

.env:
	@cp .env.example $@
