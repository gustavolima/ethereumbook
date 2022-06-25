import "Faucet.sol";

contract Token is Mortal {
    Faucet _faucet;

    constructor(address _f) {
        _faucet = Faucet(payable(_f));
        _faucet.withdraw(0.1 ether);
    }
}
