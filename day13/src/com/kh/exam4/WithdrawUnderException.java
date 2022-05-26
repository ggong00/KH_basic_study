package com.kh.exam4;

public class WithdrawUnderException extends Throwable {

    public WithdrawUnderException() {
    }

    public WithdrawUnderException(String message) {
        super(message);
    }

    public WithdrawUnderException(String message, Throwable cause) {
        super(message, cause);
    }

    public WithdrawUnderException(Throwable cause) {
        super(cause);
    }

    public WithdrawUnderException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
