package com.alura.alurabank.config;


import com.alura.alurabank.controller.form.ContaCorrenteForm;
import com.alura.alurabank.dominio.ContaCorrente;
import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ModelMapperBean {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.createTypeMap(ContaCorrenteForm.class, ContaCorrente.class)
                .addMapping(src -> src.getBanco(), ContaCorrente::setBanco)
                .addMapping(src -> src.getAgencia(), ContaCorrente::setAgencia)
                .addMapping(src -> src.getNumeroConta(), ContaCorrente::setNumeroConta);
        return modelMapper;
    }
}
