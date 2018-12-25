require 'sinatra'
require_relative 'lib/deposits'
require_relative 'lib/deposit'
require_relative 'lib/depositors'
require_relative 'lib/depositor'
require_relative 'lib/query_processing'

# helpers InputChecker

configure do
	set :deposits, Deposits.init_from_file
	set :depositors, Depositors.init_from_file
end

get '/' do
	@deposits = settings.deposits
	@depositors = settings.depositors
	erb :index
end

get '/deposits/new' do
	erb :new_deposit
end

post '/deposits/new' do
	if params["pos_of_replenishment"] === "Да"
		replenish = true
	else
		replenish = false
	end
	deposit = Deposit.new(params["type"], params["percent"].to_f, replenish)
	settings.deposits.add(deposit)
	redirect to('/')
end

get '/depositors/new' do
	@deposits = settings.deposits
	erb :new_depositor
end

post '/depositors/new' do
	depositor = Depositor.new(params["l_name"], params["f_name"], params["m_name"],
                            params["dep_number"], params["dep_type"], 
                            params["dep_amount"], params["opening_date"])
	settings.depositors.add(depositor)
	redirect to('/')
end

get '/depositors/sort' do
	settings.depositors.sort_by_lastname
	redirect to('/')
end
  
get '/depositors/del/:index' do
	depositor = params["index"].to_i
	settings.depositors.delete_depositor(depositor)
	redirect to('/')
end

get '/adds' do
	erb :adds
end

post '/adds' do
	QueryProcessing.add_money(settings.depositors, settings.deposits,
														params["l_name"], params["dep_number"], 
														params["sum"])
	redirect to('/')  
end

get '/takeoff' do
  @percents = 0
	erb :takeoff
end

post '/takeoff' do
  depositor = settings.depositors.get_depositor_by_dep_num(params["dep_number"].to_i)
  deposit = settings.deposits.get_deposit_by_type(depositor.dep_type)
	perc = QueryProcessing.take_percents(depositor, deposit)
	@percents = (perc * 100).to_i.to_f/100
  erb :takeoff 
end

get '/close' do
  @percents = 0
	erb :close
end

post '/close' do
  puts "#{params["dep_number"]}"
  depositor = settings.depositors.get_depositor_by_dep_num(params["dep_number"].to_i)
  deposit = settings.deposits.get_deposit_by_type(depositor.dep_type)
	perc = QueryProcessing.close_deposit(settings.depositors, depositor, deposit)
	@percents = (perc * 100).to_i.to_f/100
  erb :close 
end

get '/depositors/calc_dep_amount' do
  puts "#{settings.depositors}"
	settings.depositors = settings.depositors.get_dep_by_diap(params["low_n"].to_f, 
																														params["high_n"].to_f)
	redirect to('/')
end