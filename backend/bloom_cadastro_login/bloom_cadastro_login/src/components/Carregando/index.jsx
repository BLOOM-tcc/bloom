import estilos from './index.module.css';

export default function Carregando() {
    return (
        <div className={estilos.bloqueio}>
            <div className={estilos.carregando}></div>  
        </div>
    );
}