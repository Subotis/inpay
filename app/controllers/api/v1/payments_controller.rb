class Api::V1::PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show ]
  def index
    @payments = Payment.all
  end

  def show
    render json: @payment, status: :ok
  end

  def create
    if payment_params[:type] == "DirectDebitPayment"
      @payment = DirectDebitPayment.create
      @payment.build_direct_debit_payment_creditor(creditor_params)
      @payment.direct_debit_payment_transactions.build(transaction_params)
    elsif payment_params[:type] == "CreditTransferPayment"
      @payment = CreditTransferPayment.create
      @payment.build_credit_transfer_payment_debtor(creditor_params)
      @payment.credit_transfer_payment_transactions.build(transaction_params)
    else
        render json: @payment.errors, status: :unprocessable_entity
    end
    if @payment.save
      render json: @payment, status: :created
    else
      @payment.delete
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id]) rescue 404
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:type, :creditor => {}, transactions: [
      :name, :iban, :bic, :amount, :mandate_date_of_signature,:mandate_id, :local_instrument, :sequence_type
    ])
  end
  def creditor_params
    payment_params.require(:creditor).permit(:name, :iban, :bic, :creditor_identifier)
  end
  def transaction_params
    payment_params.permit(transactions:[
      :name, :iban, :bic, :amount, :mandate_date_of_signature, :mandate_id, :local_instrument, :sequence_type
    ]).require(:transactions)
  end
end

