import React from 'react';
import logo from "../assets/images/logo.png";

const Header = () => {
  return (
    <header className="flex items-center gap-2 p-4 bg-white shadow-md">
      <img
        src={logo}
        alt="logo"
        className="aspect-square w-12 rounded-full p-1"
      />
      <div className="text-left text-xl font-bold">
        <span className="text-blue-500">Dev</span>
        <span className="text-black">Net</span>
        <div className="text-sm text-slate-400">Web Companion</div>
      </div>
    </header>
  );
};

export default Header;