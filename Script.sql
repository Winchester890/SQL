create table medicos (
	matricula int primary key,
	nome varchar(50),
	departamento varchar(50),
	cargo varchar(50),
	telefone varchar(11)
);

create table pacientes (
	id int primary key,
	nome varchar(50),
	telefone varchar(11),
	data_nascimento varchar(10)
);

create table historico_internacoes (
	id_paciente int,
	medico_resp int,
	entrada varchar(20),
	saida varchar(20),
	descricao varchar(200),
	primary key (id_paciente, medico_resp),
	constraint fk_pacientes
		foreign key(id_paciente)
		references pacientes(id),
	constraint fk_medicos
		foreign key(medico_resp)
		references medicos(matricula)
);

insert into pacientes 
(nome, telefone, data_nascimento)
values
('Luiz', '910000-0000', '17/01/2000'),
('Lucas', '910088-2000', '20/11/1998'),
('Daniel', '910600-5000', '22/03/2002')

alter table pacientes 
alter column id
	add generated by default as identity 

insert into medicos 
(nome, departamento, cargo, telefone)
values
('Roberto', 'Demartologia', 'médico', '999900-9999'),
('Arthur', 'Cardiologia', 'cirurgião', '923900-9199'),
('Vinicius', 'Urologia', 'cirurgião', '999922-9499'),
('Olavo', 'Odontologia', 'cirurgião', '990000-9999'),
('André', 'raio-X', 'enfermeiro', '999900-2222')

alter table medicos 
alter column matricula
	add generated by default as identity 

	
insert into historico_internacoes 
values
(1, 2, '30/06/2023 - 15:50', '08/07/2023 - 8:32', 'recuperação pós transplante de coração'),
(2, 3, '21/04/2023 - 10:22', '30/04/2023 - 18:15', 'recuperação pós remoção de excesso de pele'),
(3, 4, '02/10/2023 - 7:10', '03/10/2023 - 7:10', 'recuperação pós remoção do siso')

select 
	p.nome as nome_paciente, 
	count(hi.id_paciente) as quantidade_internacoes
from
	pacientes p 
inner join
	historico_internacoes hi on p.id = hi.id_paciente 
group by 
	p.id, p.nome 
order by 
	count(hi.id_paciente) desc;

select 
	m.departamento as departamento,
	count(m.departamento) as quantidade_medicos
from
	medicos m 
group by
	 m.matricula, m.departamento 
	 
	