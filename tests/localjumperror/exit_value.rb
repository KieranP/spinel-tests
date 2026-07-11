# frozen_string_literal: true
# LocalJumpError#exit_value
# yield with no block -> exit_value nil (agrees)
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.exit_value; end
begin; m001; rescue LocalJumpError => e002; v002 = e002.exit_value; p v002; end

# break with no value -> nil (agrees)
begin; proc { break }.call; rescue LocalJumpError => e003; p e003.exit_value; end

# break WITH a value -> the value
begin; proc { break 7 }.call; rescue LocalJumpError => e004; p e004.exit_value; end
begin; proc { break 7 }.call; rescue LocalJumpError => e005; v005 = e005.exit_value; p v005; end

# return with no value -> nil (agrees)
def make006; proc { return }; end
pr006 = make006
begin; pr006.call; rescue LocalJumpError => e006; p e006.exit_value; end

# return WITH a value -> the value (Spinel drops it and gives nil)
def make007; proc { return 10 }; end
pr007 = make007
begin; pr007.call; rescue LocalJumpError => e007; p e007.exit_value; end
def make008; proc { return 10 }; end
pr008 = make008
begin; pr008.call; rescue LocalJumpError => e008; v008 = e008.exit_value; p v008; end
