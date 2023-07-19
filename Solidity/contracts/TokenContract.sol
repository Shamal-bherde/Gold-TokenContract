// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ITokenContract
 * @notice Interface for the TokenContract.
 */
interface ITokenContract {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @title TokenContract
 * @notice This contract stores the balances of addresses and allows for token transfers.
 */
contract TokenContract is ITokenContract {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 private _totalSupply;

    // Stores the balance of each address.
    mapping(address => uint256) private _balances;

    // Allows addresses to transfer tokens on behalf of another address.
    mapping(address => mapping(address => uint256)) private _allowances;

    /**
     * @notice Constructor function for initializing the token contract.
     * @param tokenName The name of the token.
     * @param tokenSymbol The symbol of the token.
     * @param tokenDecimals The number of decimals the token supports.
     * @param initialSupply The initial supply of tokens.
     */
    constructor(
        string memory tokenName,
        string memory tokenSymbol,
        uint8 tokenDecimals,
        uint256 initialSupply
    ) {
        name = tokenName;
        symbol = tokenSymbol;
        decimals = tokenDecimals;
        _totalSupply = initialSupply * (10**uint256(tokenDecimals));
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    /**
     * @notice Returns the total supply of tokens.
     * @return The total supply.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @notice Returns the balance of the specified account.
     * @param account The address of the account.
     * @return The account balance.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @notice Transfers tokens from the caller's address to the recipient's address.
     * @param recipient The address receiving the tokens.
     * @param amount The amount of tokens to transfer.
     * @return A boolean indicating the success of the transfer.
     */
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    /**
     * @notice Approves the spender to spend a specified amount of tokens on behalf of the caller.
     * @param spender The address authorized to spend the tokens.
     * @param amount The amount of tokens to approve for spending.
     * @return A boolean indicating the success of the approval.
     */
    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    /**
     * @notice Returns the amount of tokens the spender is allowed to spend on behalf of the owner.
     * @param owner The address that owns the tokens.
     * @param spender The address authorized to spend the tokens.
     * @return The remaining allowance.
     */
    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @notice Internal function to transfer tokens from one address to another.
     * @param sender The address sending the tokens.
     * @param recipient The address receiving the tokens.
     * @param amount The amount of tokens to transfer.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "TokenContract: transfer from the zero address");
        require(recipient != address(0), "TokenContract: transfer to the zero address");
        require(_balances[sender] >= amount, "TokenContract: transfer amount exceeds balance");

        _balances[sender] -= amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    /**
     * @notice Internal function to approve a spender to spend tokens on behalf of the owner.
     * @param owner The address that owns the tokens.
     * @param spender The address authorized to spend the tokens.
     * @param amount The amount of tokens to approve for spending.
     */
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "TokenContract: approve from the zero address");
        require(spender != address(0), "TokenContract: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
    
    /**
     * @notice Transfers tokens from the sender's address to the recipient's address using the allowance mechanism.
     * @param sender The address sending the tokens.
     * @param recipient The address receiving the tokens.
     * @param amount The amount of tokens to transfer.
     * @return A boolean indicating the success of the transfer.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "TokenContract: transfer amount exceeds allowance");
        _approve(sender, msg.sender, currentAllowance - amount);
        
        emit Transfer(sender, recipient, amount); // Emit a transfer event
        
        return true;
    }
}
