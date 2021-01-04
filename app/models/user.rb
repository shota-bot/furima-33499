class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
                        format: {
                          with: PASSWORD_REGEX, 
                          message: "は英字と数字の両方を含めて設定してください"
                        } 


  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]/.freeze
  validates :last_name, presence: true,
                        format: {
                          with: NAME_REGEX,
                          message: "は全角（漢字・ひらがな・カタカナ）で入力してください"
                        }
  validates :first_name, presence: true,
                          format: {
                           with: NAME_REGEX,
                           message: "は全角（漢字・ひらがな・カタカナ）で入力してください"
                          }

  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :last_name_kana, presence: true,
                              format: {
                               with: NAME_KANA_REGEX,
                               message: "は全角カタカナで入力してください"
                              }
  validates :first_name_kana, presence: true,
                              format: {
                                with: NAME_KANA_REGEX,
                                message: "は全角カタカナで入力してください"
                              }

  validates :birthday, presence: true
end
