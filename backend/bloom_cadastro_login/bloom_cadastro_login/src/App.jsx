import { BrowserRouter, Route, Routes } from "react-router-dom";
import Homepage from "./components/Homepage";
import LoginUsuaria from "./components/LoginUsuaria";
import CadastroUsuaria from "./components/CadastroUsuaria";
import LoginEmpresa from "./components/LoginEmpresa";
import CadastroEmpresa from "./components/CadastroEmpresa";
import Usuaria from "./components/Usuaria";
import Empresa from "./components/Empresa";


export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Homepage/>}/>
        <Route path="/LoginUsuaria" element={<LoginUsuaria/>}/>
        <Route path="/CadastroUsuaria" element={<CadastroUsuaria/>}/>
        <Route path="/LoginEmpresa" element={<LoginEmpresa/>}/>
        <Route path="/CadastroEmpresa" element={<CadastroEmpresa/>}/>
        <Route path="/usuaria" element={<Usuaria/>}/>
        <Route path="/empresa" element={<Empresa/>}/>
      </Routes>
    </BrowserRouter>
  )
}
