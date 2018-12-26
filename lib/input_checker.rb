require_relative 'deposits'

module InputChecker
  def contains_float?(string)
    num = string.to_f
    num.to_s == string
  end

  def contains_integer?(string)
    unless string == ''
      num = string.to_i
      return num.to_s == string
    end
    true
  end

  def num_is_non_negative?(string)
    unless string == ''
      if contains_integer?(string)
        return string.to_i > 0
      end
    end
    true
  end

  def string_is_not_empty?(string)
    string != ''
  end

  def check_deposit_type(deposits)
    @errors = []
    deposits.each do |dep|
      if dep.type == params["type"]
        @errors.append('Вклад с таким названием уже существует!')
      end
    end
  end

  def check_percent(params)
    @errors = []
    unless contains_integer?(params["percent"])
      @errors.append('Вы ввели неправильное значение в поле Процент')
    end
    unless num_is_non_negative?(params["percent"])
      @errors.append('Число в поле Процент не может быть отрицательным')
    end
    unless string_is_not_empty?(params["percent"])
      @errors.append('Строка в поле Процент не может быть пустой')
    end
    @errors
  end

  def check_deposit_input(params)
    @errors = []
    @errors.append(check_percent(params))
    unless string_is_not_empty?(params["type"])
      @errors.append('Строка в поле Название депозита не может быть пустой')
    end
    @errors
  end

  def check_dep_number(params)
    @errors = []
    unless string_is_not_empty?(params["dep_number"])
      @errors.append('Строка в поле Номер вклада не может быть пустой')
    end
    unless contains_integer?(params["dep_number"])
      @errors.append('Вы ввели неправильное значение в поле Номер вклада')
    end
    unless num_is_non_negative?(params["dep_number"])
      @errors.append('Число в поле Номер вклада не может быть отрицательным')
    end
    unless contains_integer?(params["dep_amount"])
      @errors.append('Вы ввели неправильное значение в поле Сумма вклада')
    end
    unless string_is_not_empty?(params["dep_amount"])
      @errors.append('Строка в поле Сумма вклада не может быть пустой')
    end
    unless num_is_non_negative?(params["dep_amount"])
      @errors.append('Число в поле Сумма вклада не может быть отрицательным')
    end
    @errors
  end

  def check_depositor_input(params)
    @errors = []
    @errors.append(check_dep_number(params))
    unless string_is_not_empty?(params["l_name"])
      @errors.append('Строка в поле Фамилия вкладчика не может быть пустой')
    end
    unless string_is_not_empty?(params["f_name"])
      @errors.append('Строка в поле Имя вкладчика не может быть пустой')
    end
    unless string_is_not_empty?(params["m_name"])
      @errors.append('Строка в поле Отчество вкладчика не может быть пустой')
    end
    @errors
  end

  
end
