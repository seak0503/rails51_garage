module Garage::ResourceCastingResponder
  def display(resource, given_options={})
    # 下記を実施するとHypermediaResponderのtransformに書いた
    # ページネーション処理がうまくいかなくなるのでコメントアウト
    #if @caster
    #  resource = @caster.call(resource)
    #end
    super(resource, given_options)
  end
end
